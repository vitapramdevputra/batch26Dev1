public class PrimitiveDT2 {
    public void printNewDate(){
        //new dates
            //newInstance(Year, Month, Day)
        Date d1 = Date.newInstance(1995, 7, 15);
        system.debug('d1 => ' + d1);

        Date d2 = Date.newInstance(2027, 10, 25); //newInstance(year, month, day)
        system.debug('d2 => ' + d2);

        Date d3 = Date.today(); //today's date. Always.
        system.debug('d3 => ' + d3);
    }

    public void printNewTime(){
                //newInstance(hour, min, sec, millisec)
        Time t1 = Time.newInstance(7, 47, 40, 125);
        system.debug(t1);

        Time t2 = Time.newInstance(10, 110, 10, 5000);
        system.debug(t2);
    }

    public void printNewDateTime(){
        Date d1 = Date.newInstance(1995, 7, 15);
        system.debug('d1 => ' + d1);

        Time t1 = Time.newInstance(7, 47, 40, 125);
        system.debug(t1);

        Time t2 = Time.newInstance(19, 30, 40, 125);
        system.debug(t2);

                    //newInstance(date, time);
        Datetime dt1 = Datetime.newInstance(d1, t2); //creating as per user's timezone
        system.debug('dt1 => ' + dt1); //prints as GMT
    }

    public void printNewDateTime2(){
        //we can create datetime in other ways also.

        Datetime dt2 = Datetime.newInstance(2019, 6, 24); //time will be midnight of current user's timezone.
        system.debug('dt2 => ' + dt2); //print GMT

        Datetime dt3 = Datetime.newInstance(2019, 6, 24, 10,30,50); //year, month, day, hour, minute, seconds
        system.debug('dt3 => ' + dt3); //print GMT

        Datetime dt4 = datetime.now();
        system.debug('dt4 => ' + dt4); //current datetime 
       

    }

     public void printNewDateTime3(){
        //creating a new datetime by passing number of milliseconds. This many milliseconds passed from 1970 Jan 1 midnight GMT.
        Datetime dt5 = Datetime.newInstance(0);
        system.debug('dt5 ==> ' + dt5);

        Datetime dt6 = Datetime.newInstance(50000);
        system.debug('dt6 ==> ' + dt6);

        Datetime dt7 = Datetime.newInstance(264621540000L);
        system.debug('dt7 ==>' + dt7);
     }

     public void calculateAge(){
        //today date
        date todaydate = date.today();
        //birthdate
        date birthdate = date.newInstance(1990, 10, 9);

        //calculate age in months
        integer ageInMonths = birthdate.monthsBetween(todaydate);
        system.debug('Vitap age in months: ' + ageInMonths);

        integer ageIndays = birthdate.daysBetween(todaydate);
        system.debug('Age in days: ' + ageIndays);

        date siyaBirthdate = date.newInstance(2023, 8, 4);
        
        system.debug('Siya Age in days: ' + siyaBirthdate.daysBetween(todaydate));
     }

     public void subscriptionEndDate(){
        date startDate = date.today();
        //subscription is of 1000 days. What is the end date?
        date endDate = startDate.addDays(1000);
        system.debug('end date: ' + endDate);
        system.debug('end date year: ' + endDate.year());

        date newStartDate = startDate.addDays(-1000);
        system.debug('start date if today was enddate : ' + newStartDate);

     }

     


}