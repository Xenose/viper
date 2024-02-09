import os
import subprocess
import json

class Stat:
    name : str
    file_count : int
    line_count : int
    procentage : float

    def __init__(self, name, file_count, line_count, procentage):
        self.name = name
        self.file_count = file_count
        self.line_count = line_count
        self.procentage = procentage

_SCRIPT_FULL_PATH = __file__
_SCRIPT_PATH = os.path.dirname(_SCRIPT_FULL_PATH)
_LIBRARY_PATH = os.path.dirname(_SCRIPT_PATH)

_JSON_PATH = _LIBRARY_PATH + "/resources/stats/project.json"
_README_PATH = _LIBRARY_PATH + "/README.md"

_STATS = [ ]

def GenerateReport():
    subprocess.run(
            f"cd  {_LIBRARY_PATH}; cloc --force-lang='C',h --vcs git --json | jq -c > {_JSON_PATH}",
            shell=True)

def ParseJson():
    with open(_JSON_PATH) as json_file:
        j = json.load(json_file)

        for header in j:
            if ("header" == header) or ("SUM" == header):
                continue
            
            _STATS.append(
                    Stat(header, 
                         j[header]["nFiles"], 
                         j[header]["code"], 
                         j[header]["code"] / j["SUM"]["code"] * 100))


        _STATS.append(
                Stat("Summary", 
                    j["SUM"]["nFiles"], 
                    j["SUM"]["code"], 
                    100))

def WriteToReadme():
    out = ""
    
    with open(_README_PATH, 'r') as readme:
        skip = False

        for l in readme:
            l = l.rstrip('\n')
            
            if ("[](python-stats-start)" == l):
                skip = True

                out += l + "\n\n"
                out += "|  Language       | File Count | Lines of Code | Procentage |\n"
                out += "| --------------- | ---------- | ------------- | ---------- |\n"

                for i in _STATS:
                    out += f"| {i.name.ljust(16)}"
                    out += f"| {str(i.file_count).ljust(11)}"
                    out += f"| {str(i.line_count).ljust(14)}"
                    out += f"| {i.procentage:.2f}%".ljust(13)
                    out += f"|\n"

                out += "\n"

            if ("[](python-stats-end)" == l):
                skip = False

            if (True == skip):
                continue
            
            out += l + "\n"
        ## End of readme 
    
    with open(_README_PATH, 'w') as readme:
        readme.write(out)

def Main():
    GenerateReport()
    ParseJson()
    WriteToReadme()


if __name__ == '__main__':
    Main()

