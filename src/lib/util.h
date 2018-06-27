#include <iostream>
#include <string>

namespace utl
{
std::string getOsName()
{
#ifdef _WIN64
    return "ntk-64";
#elif __unix || __unix__
    return "unix";
#else
    return "other";
#endif
}
} // namespace utl
