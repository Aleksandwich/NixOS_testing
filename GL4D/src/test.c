#include <GL4D/gl4duw_SDL2.h>

int main(int argc, char ** argv) {
    /* Initialisation de la fenêtre et du contexte OpenGL */
    if(!gl4duwCreateWindow(argc, argv,
        "Mon Premier Programme GL4D",
        10, 10, 800, 600,
        GL4DW_RESIZABLE | GL4DW_SHOWN))
        return 1;

    /* La boucle principale */
    gl4duwMainLoop();
    return 0;
}
