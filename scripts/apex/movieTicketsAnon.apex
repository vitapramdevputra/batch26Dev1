system.debug('1. available tickets: ' + MovieTickets.availableTickets);


MovieTickets m = new MovieTickets();
m.bookMovieTickets('John', 10);
system.debug('m.tempAV ' + m.tempAV);

system.debug('2. available tickets: ' + MovieTickets.availableTickets);

MovieTickets m2 = new MovieTickets();
m2.bookMovieTickets('John', 30);
system.debug('m2.tempAV ' + m2.tempAV);

system.debug('3. available tickets: ' + MovieTickets.availableTickets);


MovieTickets m3 = new MovieTickets();
m3.bookMovieTickets('John', 30);
system.debug('m3.tempAV ' + m3.tempAV);

system.debug('4. available tickets: ' + MovieTickets.availableTickets);