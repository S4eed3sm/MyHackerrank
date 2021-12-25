#include <bits/stdc++.h>

using namespace std;

/*
 * Complete the 'timeConversion' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

string timeConversion(string s) {
	string time(s, 0, s.length() - 2);
	string am_pm(s, s.length() - 2, s.length());
    size_t i{time.find_first_of(':')};
	string hh(time, 0, i);
	string rest(time, i);
    int hh_int = stoi(hh)%12;
    if (am_pm == "PM")
        hh_int += 12;
    char tmp[11];
    sprintf(tmp, "%02d%s", hh_int, rest.c_str());
    return string(tmp);
}

int main() {
	ofstream fout(getenv("OUTPUT_PATH"));

	string s;
	getline(cin, s);

	string result = timeConversion(s);

	fout << result << "\n";

	fout.close();

	return 0;
}
