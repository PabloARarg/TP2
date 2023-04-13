# Directorios
SRC_DIR = ./src
BUILD_DIR = ./build
BIN_DIR = $(BUILD_DIR)/bin
OBJ_DIR = $(BUILD_DIR)/obj
# Donde buscar los archivos
SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC_FILES))
# Para que por deferto hacer all make
.DEFAULT_GOAL := all
# Creando carpeta build
$(BUILD_DIR):
	mkdir: $(BUILD_DIR)
# Creando carpeta obj
$(OBJ_DIR): $(BUILD_DIR)
	mkdir $(OBJ_DIR)
# Convertir archivos .c en .o
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(OBJ_DIR)
	gcc -c $< -o $@
# Comprobacion por terminal
all: $(OBJ_FILES)
	echo $(SRC_FILES)
	echo $(OBJ_FILES)
#
clean: $(BUILD_DIR)
	rm -r $(BUILD_DIR)
