public class MapDemo {
    public static void map1(){
        //a map of STRING, INTEGER
            //key=string,
            //value = integer
        Map<string, integer> m1 = new Map<string, integer>();
        //put elements in map (no add method)
        m1.put('one', 101);
        m1.put('two', 201);
        m1.put('three', 301);
        m1.put('one', 111); //key cannot be duplicate. This is update the value of same key.
        m1.put('four', 401);
        m1.put('One', 101);

        system.debug('first ever map: ' + m1);
    }

     public static void map1ForEach(){
        //a map of STRING, INTEGER
            //key=string,
            //value = integer
        Map<string, integer> m1 = new Map<string, integer>();
        //put elements in map (no add method)
        m1.put('one', 101);
        m1.put('two', 201);
        m1.put('three', 301);
        system.debug('first ever map: ' + m1);

        //for each loop to get each key value pair...
        //1. get all the keys. 
        set<string> allKeys = m1.keySet();

        for(string eachKey: allKeys){
            system.debug('-----');
            system.debug('each key: ' + eachKey);//one
                                                 //two
                                                 //three

            //get value for eachKey
            integer eachValue = m1.get(eachKey);
            system.debug('each value : ' + eachValue);
        }
    }

    public static void mapItemPrices(){
        map<string, decimal> mapItemByPrice = new map<string, decimal>{'Milk' => 6.49,'Mango' => 15.99};
        mapItemByPrice.put('apple',5.5);
        mapItemByPrice.put('orange', 11.99);
        mapItemByPrice.put('kiwi',9.99);
        mapItemByPrice.put('Sugar', 20.9);
        mapItemByPrice.put('Cocacola', 12.49);
        mapItemByPrice.put('Water', 4.99);
        system.debug('map of item and its prices: ' + mapItemByPrice);

        map<string, decimal> highMap = new map<string, decimal>(); //more than or equal to 10
        map<string, decimal> lowMap = new map<string, decimal>(); //less than 10
        
        //set<string> allItems = mapItemByPrice.keySet();
        
        for(string eachItem: mapItemByPrice.keySet()){
            system.debug('-----------');
            //price for eachItem
            decimal eachItemPrice = mapItemByPrice.get(eachItem);
            system.debug('each item: ' + eachItem + ', each item price: ' + eachItemPrice);
            if(eachItemPrice >= 10){
                highMap.put(eachItem, eachItemPrice);//Mango => 15.99
                                                     //orange => 11.99
                                                     //Sugar => 20.9
            } else {
                lowMap.put(eachItem, eachItemPrice);
            }
        }
        system.debug('*** High map: ' + highMap);
        system.debug('*** Low map: ' + lowMap);
    }

    public static string retreiveMonth(integer mo){
        string monthName = '';

        map<integer, string> monthMap = new map<integer, string>();
        monthMap.put(1, 'January');
        monthMap.put(2, 'February');
        monthMap.put(3, 'March');
        monthMap.put(4, 'April');

        monthMap.put(5, 'May');
        monthMap.put(6, 'June');
        monthMap.put(7, 'July');
        monthMap.put(8, 'August');

        monthMap.put(9, 'September');
        monthMap.put(10, 'October');
        monthMap.put(11, 'November');
        monthMap.put(12, 'December');

        //system.debug('month map: ' + monthMap);
        //containsKey will return true if KEY is present in the map, else returns false
        if(monthMap.containsKey(mo)){
            monthName = monthMap.get(mo);
        } else {
            monthName = 'No such month exists. Please behave';
        }

        return monthName;
    }
}