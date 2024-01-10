# GNU Make project makefile autogenerated by Premake

ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild prelink

ifeq ($(config),debug)
  RESCOMP = windres
  TARGETDIR = bin/Debug
  TARGET = $(TARGETDIR)/libViperEngine.a
  OBJDIR = obj/Debug/ViperEngine
  DEFINES += -DDEBUG
  INCLUDES += -I../viper/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -g -mavx2 -mbmi2 -mpopcnt -mfma -mcx16 -mtune=znver1 -msse -msse2 -msse3 -msse4.1 -msse4.2 -mssse3 -mavx -mavx2 -mfma -mavx512f -mavx512dq -mavx512cd -mavx512bw -mavx512vl
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -g -mavx2 -mbmi2 -mpopcnt -mfma -mcx16 -mtune=znver1 -msse -msse2 -msse3 -msse4.1 -msse4.2 -mssse3 -mavx -mavx2 -mfma -mavx512f -mavx512dq -mavx512cd -mavx512bw -mavx512vl
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS)
  LINKCMD = $(AR) -rcs "$@" $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release)
  RESCOMP = windres
  TARGETDIR = bin/Release
  TARGET = $(TARGETDIR)/libViperEngine.a
  OBJDIR = obj/Release/ViperEngine
  DEFINES += -DNDEBUG
  INCLUDES += -I../viper/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -O2 -mavx2 -mbmi2 -mpopcnt -mfma -mcx16 -mtune=znver1 -msse -msse2 -msse3 -msse4.1 -msse4.2 -mssse3 -mavx -mavx2 -mfma -mavx512f -mavx512dq -mavx512cd -mavx512bw -mavx512vl
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -O2 -mavx2 -mbmi2 -mpopcnt -mfma -mcx16 -mtune=znver1 -msse -msse2 -msse3 -msse4.1 -msse4.2 -mssse3 -mavx -mavx2 -mfma -mavx512f -mavx512dq -mavx512cd -mavx512bw -mavx512vl
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -s
  LINKCMD = $(AR) -rcs "$@" $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),windows)
  RESCOMP = windres
  TARGETDIR = bin/Windows
  TARGET = $(TARGETDIR)/libViperEngine.a
  OBJDIR = obj/Windows/ViperEngine
  DEFINES += -DNDEBUG
  INCLUDES += -I../viper/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -O2 -mavx2 -mbmi2 -mpopcnt -mfma -mcx16 -mtune=znver1 -msse -msse2 -msse3 -msse4.1 -msse4.2 -mssse3 -mavx -mavx2 -mfma -mavx512f -mavx512dq -mavx512cd -mavx512bw -mavx512vl
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -O2 -mavx2 -mbmi2 -mpopcnt -mfma -mcx16 -mtune=znver1 -msse -msse2 -msse3 -msse4.1 -msse4.2 -mssse3 -mavx -mavx2 -mfma -mavx512f -mavx512dq -mavx512cd -mavx512bw -mavx512vl
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -s
  LINKCMD = $(AR) -rcs "$@" $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

OBJECTS := \
	$(OBJDIR)/main.o \
	$(OBJDIR)/dynamic_array.o \
	$(OBJDIR)/benchmark.o \
	$(OBJDIR)/exceptions.o \
	$(OBJDIR)/logger.o \
	$(OBJDIR)/glfw.o \
	$(OBJDIR)/printer.o \
	$(OBJDIR)/stringer.o \
	$(OBJDIR)/allocator.o \
	$(OBJDIR)/utils.o \
	$(OBJDIR)/cpu.o \
	$(OBJDIR)/error.o \
	$(OBJDIR)/io.o \
	$(OBJDIR)/copy.o \
	$(OBJDIR)/foreman.o \

RESOURCES := \

CUSTOMFILES := \

SHELLTYPE := posix
ifeq (.exe,$(findstring .exe,$(ComSpec)))
	SHELLTYPE := msdos
endif

$(TARGET): $(GCH) ${CUSTOMFILES} $(OBJECTS) $(LDDEPS) $(RESOURCES) | $(TARGETDIR)
	@echo Linking ViperEngine
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(CUSTOMFILES): | $(OBJDIR)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning ViperEngine
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) $(PCH) | $(OBJDIR)
$(GCH): $(PCH) | $(OBJDIR)
	@echo $(notdir $<)
	$(SILENT) $(CC) -x c-header $(ALL_CFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
else
$(OBJECTS): | $(OBJDIR)
endif

$(OBJDIR)/main.o: ../viper/source/api/main.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/dynamic_array.o: ../viper/source/core/algorithm/dynamic_array.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/benchmark.o: ../viper/source/core/debug/benchmark.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/exceptions.o: ../viper/source/core/debug/exceptions.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/logger.o: ../viper/source/core/debug/logger.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/glfw.o: ../viper/source/core/graphics/glfw.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/printer.o: ../viper/source/core/io/printer.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/stringer.o: ../viper/source/core/maths/stringer.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/allocator.o: ../viper/source/core/memory/allocator.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/utils.o: ../viper/source/core/memory/utils.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/cpu.o: ../viper/source/core/platform/cpu.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/error.o: ../viper/source/core/platform/error.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/io.o: ../viper/source/core/platform/io.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/copy.o: ../viper/source/core/string/copy.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/foreman.o: ../viper/source/core/threading/foreman.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif