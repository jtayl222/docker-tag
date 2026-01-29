#include <iostream>
#include "version.h"

int main() {
    std::cout << "Git Commit SHA: " << GIT_COMMIT_SHA << std::endl;
    return 0;
}
