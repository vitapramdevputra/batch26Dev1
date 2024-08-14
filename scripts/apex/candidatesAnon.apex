Candidate.companyName = 'Softinnovas';

Candidate c1 = new Candidate();
c1.name = 'Jerry';
c1.gender = 'Male';
c1.details();


Candidate c2 = new Candidate();
c2.name = 'Elaine';
c2.gender = 'Female';
c2.details();

system.debug('updating company name to salesforce');
Candidate.companyName = 'Salesforce';
c1.details();
c2.details();


//since it is static method, we directly call it by class name.
Candidate.details2();