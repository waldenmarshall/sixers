function [score] = dice_value_threshold(threshold_1,threshold_2)
%UNTITLED2 returns final score from a game of dice where the user keeps
%dice of value less than or equal to the threshold for that respective turn
diceleft=6;
score=0;

% roll 1
roll1=randi(6,1,diceleft);
roll1(roll1==3)=0;

% choose which dice to keep after roll 1
dicekept=0;
for i=1:diceleft
    if (roll1(i)<=threshold_1)
        score=score+roll1(i);
        dicekept=dicekept+1;
    end
end
if (dicekept==0)
    score=score+min(roll1);
    dicekept=dicekept+1;
end
diceleft=diceleft-dicekept;
if(diceleft==0)
    return
end

% roll 2
roll2=randi(6,1,diceleft);
roll2(roll2==3)=0;

% choose which dice to keep after roll 2
dicekept=0;
for i=1:diceleft
    if (roll2(i)<=threshold_2)
        score=score+roll2(i);
        dicekept=dicekept+1;
    end
end
if (dicekept==0)
    score=score+min(roll2);
    dicekept=dicekept+1;
end
diceleft=diceleft-dicekept;
if(diceleft==0)
    return
end

%roll 3
roll3=randi(6,1,diceleft);
roll3(roll1==3)=0;
score=score+sum(roll3);

end

