#include "Tools.h"

int CharToInt(const char &c){
	std::stringstream ss;
	ss<<c;
	int i;
	ss>>i;
	return i;
}
