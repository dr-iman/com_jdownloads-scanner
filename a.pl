#!/usr/bin/perl
# Sample Coded By DR.IMAN
# Site : Guardiran.org
# Tel : DarkCod3r

use HTTP::Request;
use LWP::Simple;
use LWP::UserAgent;


if ($^O =~ /MSWin32/) {system("cls"); system("color c");
}else { system("clear"); }
print "\t[+]--------------------------------------------------------[+]\n";
print "\t[!]      Jdownloads File Upload Vulnerability Scanner      [!]\n";
print "\t[!]      Sample Coded By DR.IMAN [Guardiran Security Team] [!]\n";
print "\t[!]      Scan result [ Results.txt ]                       [!]\n";
print "\t[+]--------------------------------------------------------[+]\n";
print "\n\n\t perl $0  list.txt \n\n";

open(tarrget,"<$ARGV[0]") or die "$!";
while(<tarrget>){
chomp($_);
$target = $_;
if($target !~ /http:\/\//)
{
$target = "http://$target";
}

$website = $target."/index.php?option=com_jdownloads&Itemid=0&view=upload";

$req=HTTP::Request->new(GET=>$website);
$ua=LWP::UserAgent->new();
$ua->timeout(30);
$response=$ua->request($req);
if($response->content=~ /Soumettre/ ||
   $response->content=~ /Submit/    

)
{
$Messageee ="Vulnerable :)";
open (TEXT, '>>Results.txt');
print TEXT "$target => $Messageee\n";
close (TEXT);
}
else {
$Messageee = "No Vulnerable";
}
print ">> $target => $Messageee\n";
}
