program mygame;

uses crt;

var
 health : integer;
 dmg : integer;
 armor : integer;
 enemylvl : integer;
 enemyhealth : integer;
 enemydmg : integer;
 randomintleft : integer;
 wave : integer;
 ret : integer;

 buffer : char;

{ive kindoff gave up on improving this function}
function generateenemylevel() : integer;
var p1: integer;

begin
  if wave = 0 then
  begin
     wave := 1;
  end;

  p1 := wave;
  enemydmg := round(5 * p1);
  enemyhealth := round(20 * p1);
  generateenemylevel := p1;
end;

function gameloop() : char;
var
   result: char;

begin
  while true do
  begin
   { regenerate seed }
   if randomintleft > 20 then
   begin
      randomintleft := 0;
      Randomize;
   end;

   if enemyhealth < 1 then
   begin
       writeln('youve won -- stats increased');
       enemylvl := generateenemylevel();
       dmg := dmg + Random(1)+3;
       health := 100;
       wave := wave + 1;
   end
   else if health < 1 then
   begin
      writeln('youve lost');
      writeln('wave : ',wave);
      wave := 0;
      health := 100;
      dmg := 1;
      Result := '0';
      exit;
   end;
   writeln('an wild enemy (peak creativity ngl) approaches');
   writeln('Enemy HP : ' , enemyhealth , ' Enemy DPH : ' , enemydmg);
   writeln('HP : ',health);

   writeln('1. attack');
   writeln('2. dodge');
   writeln('3. heal');
   writeln('4. exit to menu');

   buffer := ReadKey;
   writeln('youve selected : ', buffer);
   if buffer = '1' then
   begin
       enemyhealth := enemyhealth - dmg;
       writeln('dealt ',dmg,' dmg to enemy');
       health := health - enemydmg;
       writeln('enemy dealt ',enemydmg,' dmg to you');
   end
   else if buffer = '2' then
   begin
       writeln('dealt ',0,' dmg to enemy');
       health := health - round(enemydmg / 2);
       writeln('enemy dealt ',round(enemydmg / 2),' dmg to you');
   end
   else if buffer = '3' then
   begin
      writeln('dealt ',0,' dmg to enemy');
      health := health + Random(10)+25;
      writeln('enemy dealt ',round(enemydmg / 2),' dmg to you');
   end
   else if buffer = '4' then
   begin
       Result := '0';
       exit;
   end
   else
   begin
   end;
   randomintleft := randomintleft + 1;

   end;
end;

begin
 { initialization }
 Randomize;

 health := 100;
 dmg := 1;
 armor := 0 ;
 wave := 1;
 enemylvl := generateenemylevel();
 randomintleft := 0;

 { game loop }

 writeln('generik rpg');
 writeln('written in like pascal or something fuk you');
 writeln(#13#10 + 'shadowdev2025');

 writeln(#13#10#13#10#13#10 + 'survive as long as you can' + #13#10 + 'the longer you survive the better score youl get' + #13#10 + 'i dont know compete with your friends or something');

 writeln(#13#10 + '1. start the game');
 writeln('2. quit');

 while true do
 begin
   buffer := ReadKey;
   if buffer = '1' then
   begin
     buffer := gameloop();
     writeln('1. start the game');
     writeln('2. quit');
   end
   else if buffer = '2' then
   begin
     halt(0);
   end
   else if buffer = '4' then
   begin
     writeln('1. start the game');
     writeln('2. quit');
   end
 end;
end.
