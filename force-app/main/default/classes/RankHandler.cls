public class RankHandler {
    public string rankPrize(integer rank){
        string prize = '';
        //write a logic to populate prize.

        if(rank <= 0){
            prize = 'paper';
        } else if (rank == 1) {
            prize = 'Gold';
        } else if (rank == 2) {
            prize = 'Silver';
        } else if(rank == 3){
            prize = 'Bronze';
        } else if(rank <= 10){
            prize = 'Aluminium';
        } else{
            prize = 'Plastic';
        }

        return prize;
    }

    public string rankPrizeSwitch(integer rank){
        string prize = '';

        switch on rank {
            when 1 {
                prize = 'Goldy';
            }
            when 2 {
                prize = 'Silvery';
            }
            when 3 {
                prize = 'Bronzy';
            }
            when 4,5,6,7,8,9,10 { //we cannot write condition like <= 10. We can specify comma separated values.
                prize = 'Aluminiumy';
            }
            when else {
                if(rank <= 0){
                    prize = 'Disqualified';
                } else {
                    prize = 'Plastic';
                }
            }
        }
        return prize;
    }
}