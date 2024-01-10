#include<ctype.h>
#include<viper/utils/stringer.h>

/**
 * Creates a new String_t varible and populates the
 * out varible with the content of str.
 *
 * @param out :: the out put file
 * @param str :: a c-string that will be copied into the String_t
 *
 * @return Returns either the length of the new string or -1 on error
 */
int64_t ViperStringCreate(ViperString_t* out, const char* str) {
	int64_t bytes = 0;
	out->sType = VIPER_STRUCTURE_TYPE_STRING;

	if (NULL == str) {
		goto EXIT;
	}

	bytes = strlen(str);

	if (NULL == (out->data = calloc(bytes, sizeof(char)))) {
		ViperLogError("Failed to allocate string in StringCreate");
		goto ERROR_EXIT;
	}

	memcpy(out->data, str, bytes);
	out->bytes = bytes;
EXIT:
	return bytes;
ERROR_EXIT:
	return -1;
}

/**
 * Cleans up the String_t instead of manual
 * deletion.
 *
 * @param str :: The string to delete
 */
void* ViperStringDelete(ViperString_t* str) {
	free(str->data);
	free(str);
	return NULL;
}

/**
 */
int64_t ViperStringAppend(ViperString_t* out, const char* text) {
	return 0;
}

/**
 * This function searches for the next
 * valid charter and not space, tabs and
 * so on.
 *
 * @param data :: the acctual data pointer.
 * @return either returns the passed in pointer \
 * , EOF or the next valid string/charter, if \
 * the passed in pointer is NULL then NULL will \
 * be returned.
 */
char* ViperFindNextChar(char* data) {
	if (NULL == data) {
		goto EXIT;
	}
LOOP:
	switch (*data) {
		case ' ':
		case '\t':
		case '\r':
		case '\n':
			data++;
			goto LOOP;
	}
EXIT:
	return data;
}

char* ViperFindNonNumeric(char* buffer) {
	while(isdigit(buffer[0])) buffer++;
	return buffer;
}

char* ViperSkipLine(char* buffer) {
	while ('\n' != buffer[0] && '\0' != buffer[0]) {
		buffer++;
	}
	return buffer + 1; 
}
