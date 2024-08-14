public class MovieTickets {
    private string name;//non-static (or instance variable)
    private integer bookedTickets;//non-static (or instance variable)

    public integer tempAV = 100; //non-static (or instance variable)
    public static integer availableTickets = 100;
    

    public void bookMovieTickets(string name, integer bookedTickets){
        this.name = name;
        this.bookedTickets = bookedTickets;
        system.debug('***' + name + ' booked ' + bookedTickets + ' tickets.');
        availableTickets -= bookedTickets;
        tempAV -= bookedTickets;
    }
}