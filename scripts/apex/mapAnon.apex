//MapDemo.map1();

Map<string, string> mapCC = new map<string, string>();
//key = USA, value=Dollar
//key - France, value = EURO
mapCC.put('USA', 'Dollar');
mapCC.put('France', 'EURO');
mapCC.put('Netherland', 'EURO');
mapCC.put('Turkiye', 'Lira');
mapCC.put('India', 'Rupees');//this goes away
mapCC.put('India', 'Rupee'); //this will stay
mapCC.put('Canada', 'C Dollar');
mapCC.put('El Salvador', 'Bitcoin');

system.debug(mapCC);
system.debug('# of key value pair: ' + mapCC.size());

//get value of any key
string curr1 = mapCC.get('France'); //get value from key. .get(key) => value
system.debug('curr: ' + curr1);

string ct = 'USA';
string curr = mapCC.get(ct); //.get('USA') ==> Dollar
system.debug(ct + ' currency is ' + curr);

ct = 'India';
system.debug(ct + ' currency is ' + mapCC.get(ct));

//get all values - values can be duplicate (similar to list)
list<string> allCurrencies = mapCC.values(); //values will return us LIST of all the values in map
system.debug('all currencies are: ' + allCurrencies);

//get all keys - keys are unique (similar to set)
set<string> allCountries = mapCC.keySet(); //keySet will return us SET of all they keys
system.debug('all countries are: ' + allCountries);

//Direct for each loop of map is NOT available
//we do for each loop on keySet
for(string eachCountry: allCountries){
    string eachCurrency = mapCC.get(eachCountry); //mapCC.get('USA')
                                                  //mapCC.get('France')
                                                  //mapCC.get('Netherland');
    system.debug('eachCountry (eachkey) : ' + eachCountry + ', its currency is ' + eachCurrency);
} 

