#include <steam_api.h>
#include <iostream>

int main() {
    std::cout << "Initializing Steam API..." << std::endl;
    
    if (!SteamAPI_Init()) {
        std::cout << "Steam API failed to initialize!" << std::endl;
        return 1;
    }

    std::cout << "Steam API initialized!" << std::endl;

    std::cout << "Logging in as: " << SteamFriends()->GetPersonaName() << std::endl;

    std::cout << "Shutting down Steam API..." << std::endl;

    SteamAPI_Shutdown();

    return 0;
}