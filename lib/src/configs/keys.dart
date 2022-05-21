// ignore_for_file: non_constant_identifier_names

BigInt  P_raghad= BigInt.parse("4482248151160106609871348145316174897"
    "9849764719554039096395688045048053310178487");
BigInt  Q_raghad= BigInt.parse("548751333868475192731096931542049703954"
    "75080920935355580245252923343305939004903");
BigInt  P_donia= BigInt.parse("1853239550094717445070938338493667986838"
    "3424444311405679463280782405796233163977");
BigInt  Q_donia= BigInt.parse("396886448368328825261738315775361178158"
    "18454437810437210221644553381995813014959");
int gen=0;

String e_donia="";
String d_donia="";
String n_donia="";
String e_raghad="";
String n_raghad="";
String d_raghad="";

int getMaxMsgLength(BigInt p, BigInt q)
{
  int i=0;
  BigInt n= p*q;
  while(n>BigInt.zero)
    {
      n=BigInt.from(n/BigInt.from(256));
      i++;
    }
  return i;
}

String hostUrl="http://127.0.0.1:5000";
