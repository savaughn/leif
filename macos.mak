CC=clang
INCS=-I/usr/local/include -I/opt/homebrew/Cellar/glfw/3.4/include -I/opt/homebrew/Cellar/cglm/0.9.4/include -Ivendor/glad/include -Ivendor/stb_image/ -Ivendor/stb_truetype -Ivendor/stb_image_resize
LIBS=-L/usr/local/lib -lglfw -lcglm
CFLAGS+=${INCS} ${LIBS} -DLF_GLFW -O3 -ffast-math 
all: lib/leif.a

lib/leif.a: lib/leif.o
	ar cr lib/libleif.a lib/*.o
lib/leif.o: lib
	${CC} ${CFLAGS} -c leif.c -o lib/leif.o
	${CC} ${CFLAGS} -c vendor/glad/src/glad.c -o lib/glad.o
lib:
	mkdir -p lib
clean:
	rm -rf ./lib

install:
	cp lib/libleif.a /usr/local/lib/ 
	cp -r include/leif /usr/local/include/ 

uninstall:
	rm -f /usr/local/lib/libleif.a
	rm -rf /usr/local/include/leif/
	rm -rf ~/.leif/

.PHONY: all clean install uninstall