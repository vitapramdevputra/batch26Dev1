public class SetDemo {
    public static void cities() {
        set<string> citySet = new set<string>();
        citySet.add('Tokyo');
        citySet.add('Lisbon');
        citySet.add('Nairobi');
        citySet.add('Berlin');
        citySet.add('Tokyo');
        citySet.add('Tokyo');
        citySet.add('Tokyo');
        citySet.add('Lisbon');
        citySet.add('TOKYO');
        citySet.add('Lisbon');
        citySet.add('Lisbon');
        citySet.add('Lisbon');

        system.debug('cities: ' + citySet);
    }

    public static void uppercaseSet(set<string> setStr){
        //Convert all the elements in uppercase and create a new set with ALL UPPER CASE ELEMENTS.
        system.debug('original set: ' + setStr);

         set<string> uppercaseSet = new set<string>();

        //covert each string to UPPERCASE and add in newly created set(uppercaseSet)
        for(string eachStr: setStr){
            string temp = eachStr.toUpperCase();
            uppercaseSet.add(temp);
        }
        system.debug('set of all uppercase : ' + uppercaseSet); //size? 
       
    }

    public static void uppercaseSet(){
        set<string> setStr = new set<string>{'Tokyo', 'Lisbon', 'Berlin', 'Nairobi', 'Lisbon', 'TOKYO', 'Lisbon'};
        
        set<string> uppercaseSet = new set<string>();

        //covert each string to UPPERCASE and add in newly created set(uppercaseSet)
        for(string eachStr: setStr){
            string temp = eachStr.toUpperCase();
            uppercaseSet.add(temp);
        }
        system.debug('original set: ' + setStr);
        system.debug('set of all uppercase : ' + uppercaseSet); //size? 
    }

    public static void printCountry2(){
        set<string> countrySet = new set<string>{
            'United States',
            'Nigeria',
            'India',
            'Phillipines',
            'Turkiye',
            'Indonesia',
            'United Kingdom'
        };

        //what: print country if length is more than 8

        set<string> newCountrySet = new set<string>();
        for(string eachCountry: countrySet){
            if(eachCountry.length() >= 8){
                system.debug(eachCountry);
                //add eachCountry in the newly created set.
                newCountrySet.add(eachCountry);
            }
        }
        system.debug('newCountrySet ===> ' + newCountrySet);
    }

}