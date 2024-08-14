RankHandler rh = new RankHandler();
system.debug('1 => ' + rh.rankPrize(1));
system.debug('2 => ' + rh.rankPrize(2));
system.debug('3 => ' + rh.rankPrize(3));
system.debug('7 => ' + rh.rankPrize(7));
system.debug('11 => ' + rh.rankPrize(11));

system.debug('-2 => ' + rh.rankPrize(-2));


system.debug('----------');

system.debug('1 => ' +  rh.rankPrizeSwitch(1));
system.debug('2 => ' +  rh.rankPrizeSwitch(2));
system.debug('3 => ' +  rh.rankPrizeSwitch(3));
system.debug('7 => ' +  rh.rankPrizeSwitch(7));
system.debug('11 => ' + rh.rankPrizeSwitch(11));
system.debug('-2 => ' + rh.rankPrizeSwitch(-2));


