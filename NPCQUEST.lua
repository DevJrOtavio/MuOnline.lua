--[[ SCRIPT DESENVOLVIDO POR OTAVIO PARA KINGDOMMU.COM.BR
	Créditos a "GUGA, NICACIO" por ensinar a usar comandos
	DÚVIDA OU MODIFICAÇÕES +55 11 9 4702 6877 
	
	1-RODAR QUERY NO SQL (ALTER TABLE MonsterKillCount ADD [quest1] [int] NOT NULL DEFAULT 0 )
	2-ADICIONAR OS MONSTROS NO CustomMonsterKillCount
	3-ADICIONAR O NPC ONDE DESEJAR NO MAPA
	
	COMÉRCIO COMPLETAMENTE PROÍBIDO]]--





function OnReadScript()

 LogColor(2, "QUEST ACTIVE FROM SSEMU ONLINE!")
	
    local SQLName = "MuOnline"
	local SQLUser = "sa"
	local SQLPass = "gHye#9Q56by"
   
	SQLConnect(SQLName,SQLUser,SQLPass)
	
	
	---------Tabelas e Colunas -------|
	BD = "MonsterKillCount"			--|
	TableCoin = "MEMB_INFO"			--|	
	TablePcPoint = "PcPointData"	--|
	TableChar = "Character"         --|
 	
	Mob = "MonsterClass"        --|
	MobKill = "MonsterKillCount"--|
	Quest = "quest1"            --|
	ColumnPcPoint = "PcPoint"   --|
	ColumnReset = "ResetCount"  --|
	
    PlayerReset = "Name"        --|	   	
	PlayerCoin = "memb___id" 	--|
	PlayerPcPoint = "AccountID" --|
----------------------------------|
--Editar Modo de Ganho e Coluna
	RewardType = 1; -- 1 para recebe Moedas | 2 Receber item | 3 Item e Moeda | 4 Receber PcPoint | 5 Receber PcPoint e item | 6 Receber pontos | 7 Receber pontos e Resets | 8 Pontos, Resets e Cash 
	RewardColumnCoin = "Cash"; -- Nome da Coluna de WCoin desejada
	
--NPC                   				 Monstro						Quantidade
	NPCQuest1 = 507;--[[Lorencia]]		MOBKill01 = 3;--[[Spiders]]		COUNTKILL1 = 34;
	NPCQuest2 = 505;--[[Devias]]		MOBKill02 = 20;--[[Elit Yeti]]	COUNTKILL2 = 129;
	NPCQuest3 = 517;--[[Noria ]]		MOBKill03 = 30;--[[Forest]]		COUNTKILL3 = 149; 
	NPCQuest4 = 519;--[[Atlans]]		MOBKill04 = 48;--[[wizard]]		COUNTKILL4 = 169;
	NPCQuest5 = 518;--[[Icarus]]		MOBKill05 = 72;--[[Phantom ]]	COUNTKILL5 = 200; 
	NPCQuest6 =	516;--[[Tarkan]]		MOBKill06 = 502;--[[Anubis]]	COUNTKILL6 = 20; 
	NPCQuest7 =	521;--[[Kanturun3]]		MOBKill07 = 360;--[[Dreadfear]]	COUNTKILL7 = 251; 
	NPCQuest8 = 522;--[[Aida2]]			MOBKill08 = 309;--[[hellmina]]	COUNTKILL8 = 21; 
	NPCQuest9 =	520;--[[Crywolf]]		MOBKill09 = 315;--[[Werewolf(Hero)]]	COUNTKILL9 = 250;
	--NPCQuest10 = 249;					MOBKill10 = 10;					COUNTKILL10 = 35;  

		

--Item a Receber						Level do Item					Options							Skill					Coluna e linha Multiplicado por 512. Quest 1
	RewardItemIndex = 6176;				RewardLevel = 0;				RewardOptions = 0;		  	 	RewardSkill = 0; 
	RewardItemIndex2 = 6178;			RewardLevel2 = 0;				RewardOptions2 = 0;				RewardSkill2 = 0; 			
	RewardItemIndex3 = 6178;			RewardLevel3 = 0;				RewardOptions3 = 0;				RewardSkill3 = 0;
	RewardItemIndex4 = 6178;			RewardLevel4 = 0;				RewardOptions4 = 0;				RewardSkill4 = 0;
	RewardItemIndex5 = 6670;			RewardLevel5 = 0;				RewardOptions5 = 0;				RewardSkill5 = 0;
	RewardItemIndex6 = 6178;			RewardLevel6 = 0;				RewardOptions6 = 0; 			RewardSkill6 = 0;
	RewardItemIndex7 = 6178;			RewardLevel7 = 0;				RewardOptions7 = 0;				RewardSkill7 = 0;
	RewardItemIndex8 = 6178; 			RewardLevel8 = 0;				RewardOptions8 = 0;				RewardSkill8 = 0;
	RewardItemIndex9 = 6178;			RewardLevel9 = 0;				RewardOptions9 = 0;				RewardSkill9 = 0;
	RewardItemIndex10 = 6178;			RewardLevel10 = 0;				RewardOptions10 = 0;			RewardSkill10 = 0;		
	
	
--WCoin									 PcPoint						Status 							Resets	
	RewardCoin = 250;					RewardPcPoint = 250;			RewardPoint = 20000;			RewardReset = 1;
	RewardCoin2 = 150;					RewardPcPoint2 = 150;			RewardPoint2 = 20000;			RewardReset2 = 1;
	RewardCoin3 = 150;					RewardPcPoint3 = 150;			RewardPoint3 = 20000;			RewardReset3 = 1;
	RewardCoin4 = 150;					RewardPcPoint4 = 150;			RewardPoint4 = 20000;			RewardReset4 = 1;
	RewardCoin5 = 150;					RewardPcPoint5 = 150;			RewardPoint5 = 20000;			RewardReset5 = 1;
	RewardCoin6 = 150;					RewardPcPoint6 = 150;			RewardPoint6 = 20000;			RewardReset6 = 1;
	RewardCoin7 = 150;					RewardPcPoint7 = 150;			RewardPoint7 = 20000;			RewardReset7 = 1;
	RewardCoin8 = 150;					RewardPcPoint8 = 150;			RewardPoint8 = 20000;			RewardReset8 = 1;
	RewardCoin9 = 150;					RewardPcPoint9 = 150;			RewardPoint9 = 20000;			RewardReset9 = 1;
	RewardCoin10 = 150;					RewardPcPoint10 = 150;			RewardPoint10 = 20000;			RewardReset10 = 1;

--Rate Itens em Quest
	Rate1 = 2; -- Monarch
	Rate2 = 5; -- Feather
	Rate3 = 9; -- Life
	Rate4 = 20; -- Bless
	Rate5 = 24; -- Soul
	Rate6 = 40; -- Chaos
	Rate7 = 50; -- Guardian
end




function OnNpcTalk(aIndex,bIndex)
	
	local NPC = GetObjectClass(aIndex)
	local Name = GetObjectName(bIndex)
	local Conta = GetObjectAccount(bIndex)
	local Lista = SQLGetNumber("quest1")
	local Monster = SQLGetNumber('MonsterClass')
	local Kill1 = SQLGetNumber('MonsterKillCount')
	local Dialogo1 = SQLGetNumber('Dialogo')
	local Nome = SQLGetNumber ('Name')
	local Radom = RandomGetNumber(50)



	SQLQuery("SELECT TOP (1) Name "..Mob..", "..MobKill..", "..Quest..", Dialogo, Name FROM "..BD.." WHERE Name= '"..Name.."' order by Name");
	SQLQuery("SELECT TOP (1) AccountID PcPoint FROM PcPointData WHERE AccountID= '"..Conta.."' order by AccountID"); --< Dar Coin na AccountID, mudar PcPoint(Coluna) da (FROM) Tabela (PcPointData) Pela Conta (WHERE) e Ordenar pela AccountID.
	SQLQuery("SELECT TOP (1) "..PlayerCoin.." "..RewardColumnCoin.." FROM "..TableCoin.." WHERE "..PlayerCoin.."= '"..Conta.."' order by "..PlayerCoin..""); 
	
	SQLFetch();
	SQLClose();


	 
--Missão 1
if RewardType == 1 then
			
 if NPCQuest1 == NPC and Lista == 0 then  ChatTargetSend(aIndex,-1,""..Name..", você poderas nós ajudar ?")
	SQLQuery("UPDATE "..BD.." SET "..Mob.."="..MOBKill01..","..Quest.."= 2 WHERE Name= '"..Name.."'")
		SQLFetch()
			SQLClose()
				MessageSend(bIndex,0,0,string.format("Olá Cidadão, que bom ver você agora, precisamos de sua ajuda, mate aquelas aranhas na saida de lorencia e lhe darei algum item!"))
					NoticeSend(bIndex,1, ("Kailene lhe pediu para matar 35 aranhas"))
	
	elseif NPCQuest1 == NPC and Lista == 2 and Kill1 <= COUNTKILL1  then ChatTargetSend(aIndex,-1,"Receba sua recompença ao retornar obtendo as mortes informada!")
			MessageSend(bIndex,0,0, string.format("Olá, precisamos que você mante 35 Spiders. Até agora foram "..(Kill1).." Spiders mortas."))
				NoticeSend(bIndex,1, ("Kailene lhe pediu para matar 35 aranhas"))

	elseif NPCQuest1 == NPC  and  Lista == 2 and Kill1 >= COUNTKILL1  then
			MessageSend(bIndex,0,0,string.format("Obrigada pela sua ajuda! Há mais residentes precisando da sua ajuda, encontre a Nakine em Devias"))
			SQLQuery("UPDATE "..BD.." SET quest1= 3, "..Mob.."="..MOBKill02..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
				SQLQuery("UPDATE "..TablePcPoint.." SET "..ColumnPcPoint.."= "..ColumnPcPoint.."+"..RewardPcPoint.." WHERE "..PlayerPcPoint.."= '"..Conta.."'") --// Pagar via WCoin
					SQLFetch()
						SQLClose()
							ItemGiveEx(bIndex, RewardItemIndex,0,0,0,0,0,0)
								ItemGiveEx(bIndex, 7181,0,0,0,0,0,0)
								
							
								NoticeSend(bIndex,1,(""..Name..", Parabéns você Recebeu "..(RewardPcPoint).." "..(ColumnPcPoint).."!!"))
	
	elseif NPCQuest1 == NPC and Lista >= 3 and Dialogo1 == 0 then ChatTargetSend(aIndex,-1,"Obrigada, faça um ótimo proveito da recompença")
			MessageSend(bIndex,0,0,string.format("Você ja me ajudou contra aquelas aranhas terríveis, em Devias precisa de você"))
				NoticeSend(bIndex,1,("Encontre Nakine em Devias")) 
					SQLQuery("UPDATE "..BD.." SET Dialogo= 1 WHERE Name= '"..Name.."'");
						SQLFetch();
							SQLClose();
					
	elseif NPCQuest1 == NPC and Lista >= 3 and Dialogo1 == 1 then ChatTargetSend(aIndex,-1,"Missão nova, vá la em Devias, fale com a Nakine")
			MessageSend(bIndex,0,0,string.format("Por aqui nada de novo, por enquanto você pode ir a Proxima Missão."))
				NoticeSend(bIndex,1,("Encontre Nakine em Devias")) 
					SQLQuery("UPDATE "..BD.." SET Dialogo= 0 WHERE Name= '"..Name.."'");
						SQLFetch();
							SQLClose();

end
--Missão 2 
 if NPCQuest2 == NPC and Lista == 3 then
		MessageSend(bIndex,0,0,string.format("Olá "..Name..", "..MessageGet(825)..""))
			SQLQuery("UPDATE "..BD.." SET "..Quest.."= 4, "..Mob.."="..MOBKill02..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");
				SQLFetch();
					SQLClose();
					
	elseif NPCQuest2 == NPC and Lista == 4 and Kill1 <= COUNTKILL2 then
			MessageSend(bIndex,0,0,("Huuum... Ainda falta você matar alguns Elite Yeti, até agora foram "..Kill1..""))
		
	elseif NPCQuest2 == NPC and Lista == 4 and Kill1 >= COUNTKILL2 then
			MessageSend(bIndex,0,0,string.format("Ainda bem que você apareceu por aqui. Agora estamos mais despreocupados! Tome, vem comemorar!!"))
				SQLQuery("UPDATE "..BD.." SET quest1= 5, "..Mob.."="..MOBKill03..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
					SQLQuery("UPDATE "..TablePcPoint.." SET "..ColumnPcPoint.."= "..ColumnPcPoint.."+"..RewardPcPoint.." WHERE "..PlayerPcPoint.."= '"..Conta.."'") --// Pagar via WCoin
						SQLFetch()
							SQLClose()
								ItemGiveEx(bIndex, RewardItemIndex2,0,0,0,0,0,0)
								ItemGiveEx(bIndex, 7181,0,0,0,0,0,0)
								
									NoticeSend(bIndex,1,(""..Name..", você Recebeu "..(RewardCoin2).." "..(RewardColumnCoin).."!!"))
	
	elseif NPCQuest2 == NPC and Lista >= 5 then
			MessageSend(bIndex,0,0,string.format("Obrigada a nós ajudar, agora aquele Castelo está mais seguro. Procure pela Leilani em Noria."))
		
end
--Missão 3
 if NPCQuest3 == NPC and Lista == 5 then
		SQLQuery("UPDATE "..BD.." SET "..Quest.."= 6, "..Mob.."="..MOBKill03..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");
			SQLFetch()
				SQLClose()
					MessageSend(bIndex,0,0,string.format("Olá, ouvi dizer que minha irmã Nakine mandou você, disse ser o maior Guerreiro desse continente. Mate 150 Forest Monster. "))
						NoticeSend(bIndex,1, ("Leilani pediu para matar 150 de Forest Monster"))
	
	elseif NPCQuest3 == NPC and Lista == 6 and Kill1 <= COUNTKILL3 then
			MessageSend(bIndex,0,0, string.format("Conseguiu ?? Quantos Monstros você conseguiu matar ? "..(Kill1).." Forest. Por favor, volte quando conseguir matar 150."))
	  
	elseif NPCQuest3 == NPC and Lista == 6 and Kill1 >= COUNTKILL3 then
			MessageSend(bIndex,0,0,string.format("Sua jornada continua em outro lugar, volte para MAP, fale com a NPC "))
				SQLQuery("UPDATE "..BD.." SET quest1= 7, "..Mob.."="..MOBKill04..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");
					SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin3.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
						SQLFetch()
							SQLClose()
								ItemGiveEx(bIndex, 7182,0,0,0,0,0,0)

								NoticeSend(bIndex,1,(""..Name..", você Recebeu "..(RewardCoin3).." "..(RewardColumnCoin).."!!"))

	elseif NPCQuest3 == NPC and Lista >= 7 then ChatTargetSend(aIndex,-1,""..Name.." Você fez oque muitos não conseguiram, defendeu nossa cidade. ")
			MessageSend(bIndex,0,0,string.format("Noria continua livre desses monstros, você "..Name..", será bem lembrado desse feito."))
				NoticeSend(bIndex,1,("Encontre Emily em Atlans")) 	  
	
end
--Missão 4
 if NPCQuest4 == NPC and Lista == 7 then
		SQLQuery("UPDATE "..BD.." SET "..Quest.."= 8, "..Mob.."="..MOBKill04..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");
			SQLFetch()
				SQLClose()
					MessageSend(bIndex,0,0,string.format("Nas profundezas de Atlans está repleta de Monstros. Encontre Lizard King."))
						NoticeSend(bIndex,1, ("Mate 170 Lizard King"))
						
	elseif NPCQuest4 == NPC and Lista == 8 and Kill1 <= COUNTKILL4 then
			MessageSend(bIndex,0,0, string.format("Vejo por todo o oceano e sei que ainda lhe falta matar "..(COUNTKILL4-Kill1+1).." Lizard King"))
			
	elseif NPCQuest4 == NPC and Lista == 8 and Kill1 >= COUNTKILL4 then
			MessageSend(bIndex,0,0,string.format("Em nome de toda Atlans, desejamos entregar este recurso para que continue com sua jornada."))
				SQLQuery("UPDATE "..BD.." SET quest1= 9, "..Mob.."="..MOBKill05..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
					SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin4.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
						SQLFetch()
							SQLClose()
								ItemGiveEx(bIndex, 7183,0,0,0,0,0,0)
									NoticeSend(bIndex,1,(""..Name..", você Recebeu "..(RewardCoin4).." "..(RewardColumnCoin).."!!"))

	elseif NPCQuest4 == NPC and Lista >= 9 then ChatTargetSend(aIndex,-1,""..Name..". Este nome não será esquecido.")
			MessageSend(bIndex,0,0,string.format("Por enquanto não precisamos mais da sua ajuda. Obrigada!"))
				NoticeSend(bIndex,1,("Encontre Mulher Pássaro em Ícarus")) 	  
	
end
--Missão 5
 if NPCQuest5 == NPC and Lista == 9 then
		SQLQuery("UPDATE "..BD.." SET "..Quest.."= 910, "..Mob.."="..MOBKill05..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");
			SQLFetch()
				SQLClose()
					MessageSend(bIndex,0,0,string.format("Que tal você ter maior chance de ganhar Feather e Crest? Mate 200 Phantom no limite de Ícarus."))
						NoticeSend(bIndex,1, ("Melher Pássaro lhe pediu para matar 200 Phantom."))
	
	elseif NPCQuest5 == NPC and Lista == 10 and Kill1 <= COUNTKILL5 then
	  MessageSend(bIndex,0,0, string.format("Está quase la, preciso de 200 mortes, foram até agora "..(Kill1).." Phantom"))
	  
	elseif	NPCQuest5 == NPC and Lista == 10 and Kill1 >= COUNTKILL5 and Radom <= Rate1 then
		  MessageSend(bIndex,0,0,string.format("Muito bem, espero que este item seja o que procurava, caso queira repetir, volte em breve."))
			SQLQuery("UPDATE "..BD.." SET quest1= 11, "..Mob.."="..MOBKill06..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
				SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin5.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
					SQLFetch()
						SQLClose()
							ItemGiveEx(bIndex, RewardItemIndex5,1,0,0,0,0,0)
								NoticeSend(bIndex,1,(""..Radom.."")) 	  --console.log  
		
	elseif	NPCQuest5 == NPC and Lista == 10 and Kill1 >= COUNTKILL5 and Radom <= Rate2 then
		  MessageSend(bIndex,0,0,string.format("Muito bem, espero que este item seja o que procurava, caso queira repetir, volte em breve."))
			SQLQuery("UPDATE "..BD.." SET quest1= 11, "..Mob.."="..MOBKill06..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
				SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin5.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
					SQLFetch()
						SQLClose()
							ItemGiveEx(bIndex, RewardItemIndex5,0,0,0,0,0,0)
								NoticeSend(bIndex,1,(""..Radom.."")) 	  --console.log 
		
	elseif	NPCQuest5 == NPC and Lista == 10 and Kill1 >= COUNTKILL5 and Radom <= Rate3 then
		  MessageSend(bIndex,0,0,string.format("Muito bem, espero que este item seja o que procurava, caso queira repetir, volte em breve."))
			SQLQuery("UPDATE "..BD.." SET quest1= 11, "..Mob.."="..MOBKill06..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
				SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin5.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
					SQLFetch()
						SQLClose()
							ItemGiveEx(bIndex, 7184,0,0,0,0,0,0)
								NoticeSend(bIndex,1,(""..Radom.."")) 	 --console.log  
		
	elseif	NPCQuest5 == NPC and Lista == 10 and Kill1 >= COUNTKILL5 and Radom <= Rate4 then
		  MessageSend(bIndex,0,0,string.format("Muito bem, espero que este item seja o que procurava, caso queira repetir, volte em breve."))
			SQLQuery("UPDATE "..BD.." SET quest1= 11, "..Mob.."="..MOBKill06..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
				SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin5.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
					SQLFetch()
						SQLClose()
							ItemGiveEx(bIndex, 7181,0,0,0,0,0,0)
								NoticeSend(bIndex,1,(""..Radom.."")) 	 --console.log  
			
	elseif	NPCQuest5 == NPC and Lista == 10 and Kill1 >= COUNTKILL5 and Radom <= Rate5 then
		  MessageSend(bIndex,0,0,string.format("Muito bem, espero que este item seja o que procurava, caso queira repetir, volte em breve."))
			SQLQuery("UPDATE "..BD.." SET quest1= 11, "..Mob.."="..MOBKill06..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
				SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin5.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
					SQLFetch()
						SQLClose()
							ItemGiveEx(bIndex, 7182,0,0,0,0,0,0)
								NoticeSend(bIndex,1,(""..Name..", você Recebeu "..(RewardCoin5).." "..(RewardColumnCoin).."!!"))
									NoticeSend(bIndex,1,(""..Radom.."")) --console.log 	  
	
	elseif	NPCQuest5 == NPC and Lista == 10 and Kill1 >= COUNTKILL5 and Radom <= Rate6 then
		  MessageSend(bIndex,0,0,string.format("Muito bem, espero que este item seja o que procurava, caso queira repetir, volte em breve."))
			SQLQuery("UPDATE "..BD.." SET quest1= 11, "..Mob.."="..MOBKill06..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
				SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin5.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
					SQLFetch()
						SQLClose()
							ItemGiveEx(bIndex, 6159,0,0,0,0,0,0)
								NoticeSend(bIndex,1,(""..Name..", você Recebeu "..(RewardCoin5).." "..(RewardColumnCoin).."!!"))
									NoticeSend(bIndex,1,(""..Radom.."")) 	--console.log   
	
	elseif	NPCQuest5 == NPC and Lista == 10 and Kill1 >= COUNTKILL5 and Radom <= Rate7 then
		  MessageSend(bIndex,0,0,string.format("Muito bem, espero que este item seja o que procurava, caso queira repetir, volte em breve."))
			SQLQuery("UPDATE "..BD.." SET quest1= 11, "..Mob.."="..MOBKill06..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
				SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin5.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
					SQLFetch()
						SQLClose()
							ItemGiveEx(bIndex, 7199,0,0,0,0,0,0)
								NoticeSend(bIndex,1,(""..Name..", você Recebeu "..(RewardCoin5).." "..(RewardColumnCoin).."!!"))
									NoticeSend(bIndex,1,(""..Radom.."")) 	 --console.log 
	

	elseif NPCQuest5 == NPC and Lista >= 11 then ChatTargetSend(aIndex,-1,""..Name.." Você mostrou sua força, volte em breve!")
	  MessageSend(bIndex,0,0,string.format("No momento não tenho algo para você, procure por Gebe."))
		NoticeSend(bIndex,1,("Encontre Gebe em Tarkan")) 	  
	
	
end
--Missão 6
 if NPCQuest6 == NPC and Lista == 11 then
		SQLQuery("UPDATE "..BD.." SET "..Quest.."= 12, "..Mob.."="..MOBKill06..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");
			SQLFetch()
				SQLClose()
					MessageSend(bIndex,0,0,string.format("Seja bem vindo a Tarkan, aqui temos grandes oportunidades, mercado e Monstros que Dropan Caixas. Preciso que mate 20 Anubis!"))
						NoticeSend(bIndex,1, ("Gebe lhe pediu para matar 20 Anubis"))
						
	elseif NPCQuest6 == NPC and Lista == 12 and Kill1 <= COUNTKILL6 then
				MessageSend(bIndex,0,0, string.format("Anubis só aparece em determinado horário! Foram encontrados "..(Kill1).." Anubis de 20."))
	  
	elseif NPCQuest6 == NPC and Lista == 12 and Kill1 >= COUNTKILL6 then
				MessageSend(bIndex,0,0,string.format("Muitos monstros aqui em Tarkan deixam cair Caixas de Kundum. Leve essa, e quando anunciado, volte para mais."))
					SQLQuery("UPDATE "..BD.." SET quest1= 13, "..Mob.."="..MOBKill07..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
						SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin6.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
							SQLFetch()
								SQLClose()
									ItemGiveEx(bIndex, 7179,12,0,0,0,0,0)
									NoticeSend(bIndex,1,(""..Name..", você Recebeu "..(RewardCoin6).." "..(RewardColumnCoin).."!!"))

	elseif NPCQuest6 == NPC and Lista >= 13 then ChatTargetSend(aIndex,-1,""..Name..", Tarkan pode oferecer muitas possibilidades.")
			MessageSend(bIndex,0,0,string.format("Volte quando houver Invação de Dourados, assim você consegue mais Caixas."))
				NoticeSend(bIndex,1,("Nova Quest Liberada em Kanturun 3.")) 	  
	
end
--Missão 7
 if NPCQuest7 == NPC and Lista == 13 then
		SQLQuery("UPDATE "..BD.." SET "..Quest.."= 14, "..Mob.."="..MOBKill07..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");
			SQLFetch()
				SQLClose()
					MessageSend(bIndex,0,0,string.format("Neste mapa existe uma maquina que está fora de controle, aos poucos migrando seu dominio ao continente. Mate 360 Dreadfear"))
						NoticeSend(bIndex,1, ("River Ward lhe pediu para matar 360 Dreadfear"))
						
	elseif NPCQuest7 == NPC and Lista == 14 and Kill1 <= COUNTKILL7 then
			MessageSend(bIndex,0,0, string.format("O seu esforço está sendo reconhecido, você já matou "..(Kill1).." Dreadfear"))
	  
	elseif NPCQuest7 == NPC and Lista == 14 and Kill1 >= COUNTKILL7 then
			MessageSend(bIndex,0,0,string.format("Agora que você conseguiu superar e encontrou o Anel para acessar a Maquina, leve com você 10 GenStone para Refinaria."))
				SQLQuery("UPDATE "..BD.." SET quest1= 15, "..Mob.."="..MOBKill08..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
					SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin7.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
						SQLFetch()
							SQLClose()
								ItemGiveEx(bIndex, 7209,0,0,0,0,0,0)
								ItemGiveEx(bIndex, 7209,0,0,0,0,0,0)
								ItemGiveEx(bIndex, 7209,0,0,0,0,0,0)
								
								NoticeSend(bIndex,1,(""..Name..", você Recebeu "..(RewardCoin7).." "..(RewardColumnCoin).."!!"))

	elseif NPCQuest7 == NPC and Lista >= 15 then ChatTargetSend(aIndex,-1,"Aproveite bem as GenStones.")
			MessageSend(bIndex,0,0,string.format("Já está concluido sua jornada por aqui, continue guardando GenStone e ir a refinaria conseguir extrair Harmony."))
				NoticeSend(bIndex,1,("Encontre Mago Supremo em Aida2")) 	  
	
	end
--Missão 8
 if NPCQuest8 == NPC and Lista == 15 then
		SQLQuery("UPDATE "..BD.." SET "..Quest.."= 16, "..Mob.."="..MOBKill08..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");
			SQLFetch()
				SQLClose()
					MessageSend(bIndex,0,0,string.format("Por tanto tempo não tivemos algo tão horrivel, não do conta de matar o HellMaine tantas vezes. Encontre e Mate 20 vezes"))
						NoticeSend(bIndex,1, ("Mago Supremo lhe pediu para matar 20 HellMaine"))
						
	elseif NPCQuest8 == NPC and Lista == 16 and Kill1 <= COUNTKILL8 then
				MessageSend(bIndex,0,0, string.format("Sei que ele demora para aparecer, mas tenha paciência. Foi morto "..(Kill1).." HellMaine"))
	  
	elseif NPCQuest8 == NPC and Lista == 16 and Kill1 >= COUNTKILL8 then
				MessageSend(bIndex,0,0,string.format(""..Name.." Obrigado por matar o HellMaine, ele continuará voltando, entretanto não precisa mais derrota-lo."))
					SQLQuery("UPDATE "..BD.." SET quest1= 17, "..Mob.."="..MOBKill09..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
						SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin8.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
							SQLFetch()
								SQLClose()
									NoticeSend(bIndex,1,(""..Name..", você Recebeu "..(RewardCoin8).." "..(RewardColumnCoin).."!!"))

	elseif NPCQuest8 == NPC and Lista >= 17 then ChatTargetSend(aIndex,-1,""..Name..", você já o matou muitas vezes.")
				MessageSend(bIndex,0,0,string.format(""..Name..", Deixe que outro Guerreiro possa me mostrar a força que tem, no momento você pode ir para Crywolf."))
					NoticeSend(bIndex,1,("Encontre Skull of Defender em CryWolf")) 	  
	
end
--Missão 9
 if NPCQuest9 == NPC and Lista == 17 then

 	SQLQuery("UPDATE "..BD.." SET "..Quest.."= 18, "..Mob.."="..MOBKill09..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");

  SQLFetch()
  SQLClose()
	MessageSend(bIndex,0,0,string.format("Então você passou pela prova do Mago, bem então, tenho um desafio com uma recompença muito boa. Mate 250 Werewolf(Hero)!"))
	NoticeSend(bIndex,1, ("Skull lhe pediu para matar 250 Werewolf(Hero)"))
	elseif NPCQuest9 == NPC and Lista == 18 and Kill1 <= COUNTKILL9 then
	  MessageSend(bIndex,0,0, string.format("Huuum, deixa me ver, você conseguiu matar "..(Kill1).." Werewolf(Hero), ainda faltam "..(COUNTKILL9-Kill1).."."))
	elseif NPCQuest9 == NPC and Lista == 18 and Kill1 >= COUNTKILL9 then
	  MessageSend(bIndex,0,0,string.format("Missão concluida!! Vou lhe dar um item aleatório com alguns sendo bem valiosos."))
       SQLQuery("UPDATE "..BD.." SET quest1= 19, "..Mob.."="..MOBKill10..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
  	   SQLFetch()
	   SQLClose()
	   
		SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin9.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
		SQLFetch()
		SQLClose()
			NoticeSend(bIndex,1,(""..Name..", você Recebeu "..(RewardCoin9).." "..(RewardColumnCoin).."!!"))

	elseif NPCQuest9 == NPC and Lista >= 19 then ChatTargetSend(aIndex,-1,""..Name.." Obrigado pelo apoio.")
	  MessageSend(bIndex,0,0,string.format("Obrigado pela ajuda. O item que recebeu, use com sabedoria no mercado ou pessoal."))
   --   NoticeSend(bIndex,1,("Encontre Nakine em Devias")) 	  
	
	end
--Missão 10
 if NPCQuest10 == NPC and Lista == 19 then

 
	SQLQuery("UPDATE "..BD.." SET "..Quest.."= 20, "..Mob.."="..MOBKill10..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");
  SQLFetch()
  SQLClose()
	MessageSend(bIndex,0,0,string.format("Olá Cidadão, que bom ver você agora, precisamos de sua ajuda, mate aquelas aranhas na saida de lorencia e lhe darei algum item!"))
	NoticeSend(bIndex,1, ("Kailene lhe pediu para matar 30 aranhas"))
	elseif NPCQuest10 == NPC and Lista == 20 and Kill1 <= COUNTKILL10 then
	  MessageSend(bIndex,0,0, string.format("Oi novamente, fiquei sabendo que você já conseguiu matar "..(Kill1).." aranhas"))
	elseif NPCQuest10 == NPC and Lista == 20 and Kill1 >= COUNTKILL10 then
	  MessageSend(bIndex,0,0,string.format("Obrigada pela sua ajuda! Há mais residentes precisando da sua ajuda, encontre a filha da puta da minha irmã em Devias"))
       SQLQuery("UPDATE "..BD.." SET quest1= 21, "..Mob.."="..MOBKill10..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
  	   SQLFetch()
	   SQLClose()
	   
		SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin10.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
		SQLFetch()
		SQLClose()
			NoticeSend(bIndex,1,(""..Name..", você Recebeu "..(RewardCoin10).." "..(RewardColumnCoin).."!!"))

	elseif NPCQuest10 == NPC and Lista >= 21 then ChatTargetSend(aIndex,-1,""..Name.." Obrigada, espero que seja util este item que entreguei")
	  MessageSend(bIndex,0,0,string.format("Você ja me ajudou contra aquelas aranhas terríveis, em Devias precisa de você"))
      NoticeSend(bIndex,1,("Encontre Nakine em Devias")) 	  
	
	end
		  
 end -- RewardType 1 
 
 
 
 
 
 
 
if RewardType == 2 then 

 if NPCQuest1 == NPC and Lista == 0 then
 
  SQLQuery("UPDATE "..BD.." SET "..Quest.."= 1 WHERE Name= '"..Name.."'")
  SQLQuery("UPDATE "..BD.." SET "..MobKill.." = 0 WHERE Name= '"..Name.."'") 
  SQLFetch()
  SQLClose()
	MessageSend(bIndex,0,0,string.format("Olá Cidadão, que bom ver você agora, precisamos de sua ajuda, mate aquelas aranhas na saida de lorencia e lhe darei algum item!"))
	NoticeSend(bIndex,1, ("Kailene lhe pediu para matar 30 aranhas"))
	
	elseif NPCQuest1 == NPC and Lista == 1 and Kill1 <= COUNTKILL1 then
	  MessageSend(bIndex,0,0, string.format("Oi novamente, fiquei sabendo que você já conseguiu matar "..(Kill1).." aranhas"))
	  
	elseif NPCQuest1 == NPC and Lista == 1 and Kill1 >= 30 then
	  MessageSend(bIndex,0,0,string.format("Obrigada pela sua ajuda! Há mais residentes precisando da sua ajuda, encontre a filha da puta da minha irmã em Devias"))
       SQLQuery("UPDATE "..BD.." SET quest1= 2, "..Mob.."="..MOBKill01..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
  	   SQLFetch()
	   SQLClose()
			ItemGiveEx(bIndex, RewardItemIndex,RewardLevel,0,0,0,0,0)
			NoticeSend(bIndex,1,(""..Name..", você Recebeu Item no inventário !!"))

	elseif NPCQuest1 == NPC and Lista >= 2 then ChatTargetSend(aIndex,-1,""..Name.." Obrigada, espero que seja util este item que entreguei")
	  MessageSend(bIndex,0,0,string.format("Você ja me ajudou contra aquelas aranhas terríveis, em Devias precisa de você"))
      NoticeSend(bIndex,1,("Encontre Nakine em Devias")) 	  
	
	end
	 

	   
	--Segunda Missão, Quest 2 
if NPCQuest2 == NPC and Lista == 2 then
 MessageSend(bIndex,0,0,string.format("Olá "..Name..", "..MessageGet(825)..""))
	SQLQuery("UPDATE "..BD.." SET "..Quest.."= 3, "..Mob.."="..MOBKill01..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");
	SQLFetch();
	SQLClose();
	
	elseif NPCQuest2 == NPC and Lista == 3 and Kill1 <= 129 then
		MessageSend(bIndex,0,0,("Huuum... Ainda falta você matar alguns Elite Yeti, até agora foram "..Kill1..""))
		
	elseif NPCQuest2 == NPC and Lista == 3 and Kill1 >= 130 then
		MessageSend(bIndex,0,0,string.format("Ainda bem que você apareceu por aqui. Agora estamos todo mais despreocupados! Tome, vem comemorar!!"))
		SQLQuery("UPDATE "..BD.." SET quest1= 4, "..Mob.."="..MOBKill02..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
		SQLFetch()
		SQLClose()
			ItemGiveEx(bIndex, RewardItemIndex2,RewardLevel2,0,0,0,0,0)

			NoticeSend(bIndex,1,(""..Name..", você Recebeu Item no seu inventário!!"))
	
	elseif NPCQuest2 == NPC and Lista == 4 then
		MessageSend(bIndex,0,0,string.format("Obrigada a nós ajudar, agora aquele Castelo está mais seguro. Procure pelo TESTE DE NOME em Lorencia."))
		
end


		  
 end -- RewardType 2 
 
 
if RewardType == 3 then 

 if NPCQuest1 == NPC and Lista == 0 then
 
  SQLQuery("UPDATE "..BD.." SET "..Quest.."= 1 WHERE Name= '"..Name.."'")
  SQLQuery("UPDATE "..BD.." SET "..MobKill.." = 0 WHERE Name= '"..Name.."'") 
  SQLFetch()
  SQLClose()
	MessageSend(bIndex,0,0,string.format("Olá Cidadão, que bom ver você agora, precisamos de sua ajuda, mate aquelas aranhas na saida de lorencia e lhe darei algum item!"))
	NoticeSend(bIndex,1, ("Kailene lhe pediu para matar 30 aranhas"))
	
	elseif NPCQuest1 == NPC and Lista == 1 and Kill1 <= COUNTKILL1 then
	  MessageSend(bIndex,0,0, string.format("Oi novamente, fiquei sabendo que você já conseguiu matar "..(Kill1).." aranhas"))
	  
	elseif NPCQuest1 == NPC and Lista == 1 and Kill1 >= 30 then
	  MessageSend(bIndex,0,0,string.format("Obrigada pela sua ajuda! Há mais residentes precisando da sua ajuda, encontre a filha da puta da minha irmã em Devias"))
		SQLQuery("UPDATE "..BD.." SET quest1= 2, "..Mob.."="..MOBKill01..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
		SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
  	    SQLFetch()
	    SQLClose()
			ItemGiveEx(bIndex, RewardItemIndex,RewardLevel,0,0,0,0,0)
			NoticeSend(bIndex,1,(""..Name..", você Recebeu Item e "..RewardCoin.." de WCoin !!"))

	elseif NPCQuest1 == NPC and Lista >= 2 then ChatTargetSend(aIndex,-1,""..Name.." Obrigada, espero que seja util este item que entreguei")
	  MessageSend(bIndex,0,0,string.format("Você ja me ajudou contra aquelas aranhas terríveis, em Devias precisa de você"))
      NoticeSend(bIndex,1,("Encontre Nakine em Devias")) 	  
	
	end
	 

	   
	--Segunda Missão, Quest 2 
if NPCQuest2 == NPC and Lista == 2 then
 MessageSend(bIndex,0,0,string.format("Olá "..Name..", "..MessageGet(825)..""))
	SQLQuery("UPDATE "..BD.." SET "..Quest.."= 3, "..Mob.."="..MOBKill01..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");
	SQLFetch();
	SQLClose();
	
	elseif NPCQuest2 == NPC and Lista == 3 and Kill1 <= 129 then
		MessageSend(bIndex,0,0,("Huuum... Ainda falta você matar alguns Elite Yeti, até agora foram "..Kill1..""))
		
	elseif NPCQuest2 == NPC and Lista == 3 and Kill1 >= 130 then
		MessageSend(bIndex,0,0,string.format("Ainda bem que você apareceu por aqui. Agora estamos todo mais despreocupados! Tome, vem comemorar!!"))
		SQLQuery("UPDATE "..BD.." SET quest1= 4, "..Mob.."="..MOBKill02..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
		SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin2.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
		SQLFetch()
		SQLClose()
			ItemGiveEx(bIndex, RewardItemIndex2,RewardLevel2,0,0,0,0,0)

			NoticeSend(bIndex,1,(""..Name..", você Recebeu Item e "..RewardCoin2.." de WCoin!!"))
	
	elseif NPCQuest2 == NPC and Lista == 4 then
		MessageSend(bIndex,0,0,string.format("Obrigada a nós ajudar, agora aquele Castelo está mais seguro. Procure pelo TESTE DE NOME em Lorencia."))
		
end


		  
 end -- RewardType 3 


if RewardType == 4 then 

 if NPCQuest1 == NPC and Lista == 0 then
 
  SQLQuery("UPDATE "..BD.." SET "..Quest.."= 1 WHERE Name= '"..Name.."'")
  SQLQuery("UPDATE "..BD.." SET "..MobKill.." = 0 WHERE Name= '"..Name.."'") 
  SQLFetch()
  SQLClose()
	MessageSend(bIndex,0,0,string.format("Olá Cidadão, que bom ver você agora, precisamos de sua ajuda, mate aquelas aranhas na saida de lorencia e lhe darei algum item!"))
	NoticeSend(bIndex,1, ("Kailene lhe pediu para matar 30 aranhas"))
	
	elseif NPCQuest1 == NPC and Lista == 1 and Kill1 <= COUNTKILL1 then
	  MessageSend(bIndex,0,0, string.format("Oi novamente, fiquei sabendo que você já conseguiu matar "..(Kill1).." aranhas"))
	  
	elseif NPCQuest1 == NPC and Lista == 1 and Kill1 >= 30 then
	  MessageSend(bIndex,0,0,string.format("Obrigada pela sua ajuda! Há mais residentes precisando da sua ajuda, encontre a filha da puta da minha irmã em Devias"))
		SQLQuery("UPDATE "..BD.." SET quest1= 2, "..Mob.."="..MOBKill01..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
		SQLQuery("UPDATE "..TablePcPoint.." SET "..ColumnPcPoint.."= "..ColumnPcPoint.."+"..RewardPcPoint.." WHERE "..PlayerPcPoint.."= '"..Conta.."'") --// Pagar via WCoin
  	    SQLFetch()
	    SQLClose()
			NoticeSend(bIndex,1,(""..Name..", você Recebeu "..RewardPcPoint.." de PcPoint !!"))

	elseif NPCQuest1 == NPC and Lista >= 2 then ChatTargetSend(aIndex,-1,""..Name.." Obrigada, espero que seja util este item que entreguei")
	  MessageSend(bIndex,0,0,string.format("Você ja me ajudou contra aquelas aranhas terríveis, em Devias precisa de você"))
      NoticeSend(bIndex,1,("Encontre Nakine em Devias")) 	  
	
	end
	 

	   
	--Segunda Missão, Quest 2 
if NPCQuest2 == NPC and Lista == 2 then
 MessageSend(bIndex,0,0,string.format("Olá "..Name..", "..MessageGet(825)..""))
	SQLQuery("UPDATE "..BD.." SET "..Quest.."= 3, "..Mob.."="..MOBKill01..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");
	SQLFetch();
	SQLClose();
	
	elseif NPCQuest2 == NPC and Lista == 3 and Kill1 <= 129 then
		MessageSend(bIndex,0,0,("Huuum... Ainda falta você matar alguns Elite Yeti, até agora foram "..Kill1..""))
		
	elseif NPCQuest2 == NPC and Lista == 3 and Kill1 >= 130 then
		MessageSend(bIndex,0,0,string.format("Ainda bem que você apareceu por aqui. Agora estamos todo mais despreocupados! Tome, vem comemorar!!"))
		SQLQuery("UPDATE "..BD.." SET quest1= 4, "..Mob.."="..MOBKill02..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
		SQLQuery("UPDATE "..TablePcPoint.." SET "..ColumnPcPoint.."= "..ColumnPcPoint.."+"..RewardPcPoint2.." WHERE "..PlayerPcPoint.."= '"..Conta.."'") --// Pagar via WCoin
		SQLFetch()
		SQLClose()

			NoticeSend(bIndex,1,(""..Name..", você Recebeu "..RewardPcPoint2.." de PcPoint!!"))
	
	elseif NPCQuest2 == NPC and Lista == 4 then
		MessageSend(bIndex,0,0,string.format("Obrigada a nós ajudar, agora aquele Castelo está mais seguro. Procure pelo TESTE DE NOME em Lorencia."))
		
end


		  
 end -- RewardType 4


if RewardType == 5 then 

 if NPCQuest1 == NPC and Lista == 0 then
 
  SQLQuery("UPDATE "..BD.." SET "..Quest.."= 1 WHERE Name= '"..Name.."'")
  SQLQuery("UPDATE "..BD.." SET "..MobKill.." = 0 WHERE Name= '"..Name.."'") 
  SQLFetch()
  SQLClose()
	MessageSend(bIndex,0,0,string.format("Olá Cidadão, que bom ver você agora, precisamos de sua ajuda, mate aquelas aranhas na saida de lorencia e lhe darei algum item!"))
	NoticeSend(bIndex,1, ("Kailene lhe pediu para matar 30 aranhas"))
	
	elseif NPCQuest1 == NPC and Lista == 1 and Kill1 <= COUNTKILL1 then
	  MessageSend(bIndex,0,0, string.format("Oi novamente, fiquei sabendo que você já conseguiu matar "..(Kill1).." aranhas"))
	  
	elseif NPCQuest1 == NPC and Lista == 1 and Kill1 >= 30 then
	  MessageSend(bIndex,0,0,string.format("Obrigada pela sua ajuda! Há mais residentes precisando da sua ajuda, encontre a filha da puta da minha irmã em Devias"))
		SQLQuery("UPDATE "..BD.." SET quest1= 2, "..Mob.."="..MOBKill01..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
		SQLQuery("UPDATE "..TablePcPoint.." SET "..ColumnPcPoint.."= "..ColumnPcPoint.."+"..RewardPcPoint.." WHERE "..PlayerPcPoint.."= '"..Conta.."'") --// Pagar via WCoin
  	    SQLFetch()
	    SQLClose()
			ItemGiveEx(bIndex, RewardItemIndex,RewardLevel,0,0,0,0,0)
		
			NoticeSend(bIndex,1,(""..Name..", você Recebeu Item e "..RewardPcPoint.." de PcPoint !!"))

	elseif NPCQuest1 == NPC and Lista >= 2 then ChatTargetSend(aIndex,-1,""..Name.." Obrigada, espero que seja util este item que entreguei")
	  MessageSend(bIndex,0,0,string.format("Você ja me ajudou contra aquelas aranhas terríveis, em Devias precisa de você"))
      NoticeSend(bIndex,1,("Encontre Nakine em Devias")) 	  
	
	end
	 

	   
	--Segunda Missão, Quest 2 
if NPCQuest2 == NPC and Lista == 2 then
 MessageSend(bIndex,0,0,string.format("Olá "..Name..", "..MessageGet(825)..""))
	SQLQuery("UPDATE "..BD.." SET "..Quest.."= 3, "..Mob.."="..MOBKill01..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");
	SQLFetch();
	SQLClose();
	
	elseif NPCQuest2 == NPC and Lista == 3 and Kill1 <= 129 then
		MessageSend(bIndex,0,0,("Huuum... Ainda falta você matar alguns Elite Yeti, até agora foram "..Kill1..""))
		
	elseif NPCQuest2 == NPC and Lista == 3 and Kill1 >= 130 then
		MessageSend(bIndex,0,0,string.format("Ainda bem que você apareceu por aqui. Agora estamos todo mais despreocupados! Tome, vem comemorar!!"))
		SQLQuery("UPDATE "..BD.." SET quest1= 4, "..Mob.."="..MOBKill02..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
		SQLQuery("UPDATE "..TablePcPoint.." SET "..ColumnPcPoint.."= "..ColumnPcPoint.."+"..RewardPcPoint2.." WHERE "..PlayerPcPoint.."= '"..Conta.."'") --// Pagar via WCoin
		SQLFetch()
		SQLClose()
			ItemGiveEx(bIndex, RewardItemIndex2,RewardLevel2,0,0,0,0,0)

			NoticeSend(bIndex,1,(""..Name..", você Recebeu Item e "..RewardPcPoint2.." de PcPoint!!"))
	
	elseif NPCQuest2 == NPC and Lista == 4 then
		MessageSend(bIndex,0,0,string.format("Obrigada a nós ajudar, agora aquele Castelo está mais seguro. Procure pelo TESTE DE NOME em Lorencia."))
		
end


		  
 end -- RewardType 5

 
if RewardType == 6 then 

 if NPCQuest1 == NPC and Lista == 0 then
 
  SQLQuery("UPDATE "..BD.." SET "..Quest.."= 1 WHERE Name= '"..Name.."'")
  SQLQuery("UPDATE "..BD.." SET "..MobKill.." = 0 WHERE Name= '"..Name.."'") 
  SQLFetch()
  SQLClose()
	MessageSend(bIndex,0,0,string.format("Olá Cidadão, que bom ver você agora, precisamos de sua ajuda, mate aquelas aranhas na saida de lorencia e lhe darei algum item!"))
	NoticeSend(bIndex,1, ("Kailene lhe pediu para matar 30 aranhas"))
	
	elseif NPCQuest1 == NPC and Lista == 1 and Kill1 <= COUNTKILL1 then
	  MessageSend(bIndex,0,0, string.format("Oi novamente, fiquei sabendo que você já conseguiu matar "..(Kill1).." aranhas"))
	  
	elseif NPCQuest1 == NPC and Lista == 1 and Kill1 >= 30 then
	  MessageSend(bIndex,0,0,string.format("Obrigada pela sua ajuda! Há mais residentes precisando da sua ajuda, encontre a filha da puta da minha irmã em Devias"))
		SQLQuery("UPDATE "..BD.." SET quest1= 2, "..Mob.."="..MOBKill01..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
  	    SQLFetch()
	    SQLClose()
			SetObjectLevelUpPoint(bIndex, (RewardPoint))
			NoticeSend(bIndex,1,(""..Name..", você Recebeu "..RewardPoint.." de Status !!"))

	elseif NPCQuest1 == NPC and Lista >= 2 then ChatTargetSend(aIndex,-1,""..Name.." Obrigada, espero que seja util este item que entreguei")
	  MessageSend(bIndex,0,0,string.format("Você ja me ajudou contra aquelas aranhas terríveis, em Devias precisa de você"))
      NoticeSend(bIndex,1,("Encontre Nakine em Devias")) 	  
	
	end
	 

	   
	--Segunda Missão, Quest 2 
if NPCQuest2 == NPC and Lista == 2 then
 MessageSend(bIndex,0,0,string.format("Olá "..Name..", "..MessageGet(825)..""))
	SQLQuery("UPDATE "..BD.." SET "..Quest.."= 3, "..Mob.."="..MOBKill01..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");
	SQLFetch();
	SQLClose();
	
	elseif NPCQuest2 == NPC and Lista == 3 and Kill1 <= 129 then
		MessageSend(bIndex,0,0,("Huuum... Ainda falta você matar alguns Elite Yeti, até agora foram "..Kill1..""))
		
	elseif NPCQuest2 == NPC and Lista == 3 and Kill1 >= 130 then
		MessageSend(bIndex,0,0,string.format("Ainda bem que você apareceu por aqui. Agora estamos todo mais despreocupados! Tome, vem comemorar!!"))
		SQLQuery("UPDATE "..BD.." SET quest1= 4, "..Mob.."="..MOBKill02..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
		SQLFetch()
		SQLClose()
			SetObjectLevelUpPoint(bIndex, (RewardPoint2))
			NoticeSend(bIndex,1,(""..Name..", você Recebeu "..RewardPoint.." de Status !!"))
	
	elseif NPCQuest2 == NPC and Lista == 4 then
		MessageSend(bIndex,0,0,string.format("Obrigada a nós ajudar, agora aquele Castelo está mais seguro. Procure pelo TESTE DE NOME em Lorencia."))
		
end


		  
 end -- RewardType 6
 
 
if RewardType == 7 then 

 if NPCQuest1 == NPC and Lista == 0 then
 
  SQLQuery("UPDATE "..BD.." SET "..Quest.."= 1 WHERE Name= '"..Name.."'")
  SQLQuery("UPDATE "..BD.." SET "..MobKill.." = 0 WHERE Name= '"..Name.."'") 
  SQLFetch()
  SQLClose()
	MessageSend(bIndex,0,0,string.format("Olá Cidadão, que bom ver você agora, precisamos de sua ajuda, mate aquelas aranhas na saida de lorencia e lhe darei algum item!"))
	NoticeSend(bIndex,1, ("Kailene lhe pediu para matar 30 aranhas"))
	
	elseif NPCQuest1 == NPC and Lista == 1 and Kill1 <= COUNTKILL1 then
	  MessageSend(bIndex,0,0, string.format("Oi novamente, fiquei sabendo que você já conseguiu matar "..(Kill1).." aranhas"))
	  
	elseif NPCQuest1 == NPC and Lista == 1 and Kill1 >= 30 then
	  MessageSend(bIndex,0,0,string.format("Obrigada pela sua ajuda! Há mais residentes precisando da sua ajuda, encontre a filha da puta da minha irmã em Devias"))
		SQLQuery("UPDATE "..BD.." SET quest1= 2, "..Mob.."="..MOBKill01..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
        SQLQuery("UPDATE "..TableChar.." SET "..ColumnReset.."= "..ColumnReset.."+"..RewardReset.." WHERE "..PlayerReset.."= '"..Name.."'");
  	    SQLFetch()
	    SQLClose()
			SetObjectLevelUpPoint(bIndex, (RewardPoint))
			NoticeSend(bIndex,1,(""..Name..", você Recebeu "..RewardPoint.." de Status e "..RewardReset.." de Resets !!"))

	elseif NPCQuest1 == NPC and Lista >= 2 then ChatTargetSend(aIndex,-1,""..Name.." Obrigada, espero que seja util este item que entreguei")
	  MessageSend(bIndex,0,0,string.format("Você ja me ajudou contra aquelas aranhas terríveis, em Devias precisa de você"))
      NoticeSend(bIndex,1,("Encontre Nakine em Devias")) 	  
	
	end
	 

	   
	--Segunda Missão, Quest 2 
if NPCQuest2 == NPC and Lista == 2 then
 MessageSend(bIndex,0,0,string.format("Olá "..Name..", "..MessageGet(825)..""))
	SQLQuery("UPDATE "..BD.." SET "..Quest.."= 3, "..Mob.."="..MOBKill01..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");
	SQLFetch();
	SQLClose();
	
	elseif NPCQuest2 == NPC and Lista == 3 and Kill1 <= 129 then
		MessageSend(bIndex,0,0,("Huuum... Ainda falta você matar alguns Elite Yeti, até agora foram "..Kill1..""))
		
	elseif NPCQuest2 == NPC and Lista == 3 and Kill1 >= 130 then
		MessageSend(bIndex,0,0,string.format("Ainda bem que você apareceu por aqui. Agora estamos todo mais despreocupados! Tome, vem comemorar!!"))
		SQLQuery("UPDATE "..BD.." SET quest1= 4, "..Mob.."="..MOBKill02..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
		SQLQuery("UPDATE "..TableChar.." SET "..ColumnReset.."= "..ColumnReset.."+"..RewardReset2.." WHERE "..PlayerReset.."= '"..Name.."'");
		SQLFetch()
		SQLClose()
			SetObjectLevelUpPoint(bIndex, (RewardPoint2))
			NoticeSend(bIndex,1,(""..Name..", você Recebeu "..RewardPoint2.." de Status e "..RewardReset2.." de Resets !!"))
	
	elseif NPCQuest2 == NPC and Lista == 4 then
		MessageSend(bIndex,0,0,string.format("Obrigada a nós ajudar, agora aquele Castelo está mais seguro. Procure pelo TESTE DE NOME em Lorencia."))
		
end


		  
 end -- RewardType 7
 
 
if RewardType == 8 then 

 if NPCQuest1 == NPC and Lista == 0 then
 
  SQLQuery("UPDATE "..BD.." SET "..Quest.."= 1 WHERE Name= '"..Name.."'")
  SQLQuery("UPDATE "..BD.." SET "..MobKill.." = 0 WHERE Name= '"..Name.."'") 
  SQLFetch()
  SQLClose()
	MessageSend(bIndex,0,0,string.format("Olá Cidadão, que bom ver você agora, precisamos de sua ajuda, mate aquelas aranhas na saida de lorencia e lhe darei algum item!"))
	NoticeSend(bIndex,1, ("Kailene lhe pediu para matar 30 aranhas"))
	
	elseif NPCQuest1 == NPC and Lista == 1 and Kill1 <= COUNTKILL1 then
	  MessageSend(bIndex,0,0, string.format("Oi novamente, fiquei sabendo que você já conseguiu matar "..(Kill1).." aranhas"))
	  
	elseif NPCQuest1 == NPC and Lista == 1 and Kill1 >= 30 then
	  MessageSend(bIndex,0,0,string.format("Obrigada pela sua ajuda! Há mais residentes precisando da sua ajuda, encontre a filha da puta da minha irmã em Devias"))
		SQLQuery("UPDATE "..BD.." SET quest1= 2, "..Mob.."="..MOBKill01..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
        SQLQuery("UPDATE "..TableChar.." SET "..ColumnReset.."= "..ColumnReset.."+"..RewardReset.." WHERE "..PlayerReset.."= '"..Name.."'");
		SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
  	    SQLFetch()
	    SQLClose()
			SetObjectLevelUpPoint(bIndex, (RewardPoint))
			NoticeSend(bIndex,1,(""..Name..", você Recebeu "..RewardPoint.." de Status, "..RewardReset.." de Resets e "..RewardCoin.." de WCoin !!"))

	elseif NPCQuest1 == NPC and Lista >= 2 then ChatTargetSend(aIndex,-1,""..Name.." Obrigada, espero que seja util este item que entreguei")
	  MessageSend(bIndex,0,0,string.format("Você ja me ajudou contra aquelas aranhas terríveis, em Devias precisa de você"))
      NoticeSend(bIndex,1,("Encontre Nakine em Devias")) 	  
	
	end
	 

	   
	--Segunda Missão, Quest 2 
if NPCQuest2 == NPC and Lista == 2 then
 MessageSend(bIndex,0,0,string.format("Olá "..Name..", "..MessageGet(825)..""))
	SQLQuery("UPDATE "..BD.." SET "..Quest.."= 3, "..Mob.."="..MOBKill01..", "..MobKill.."= 0 WHERE Name= '"..Name.."'");
	SQLFetch();
	SQLClose();
	
	elseif NPCQuest2 == NPC and Lista == 3 and Kill1 <= 129 then
		MessageSend(bIndex,0,0,("Huuum... Ainda falta você matar alguns Elite Yeti, até agora foram "..Kill1..""))
		
	elseif NPCQuest2 == NPC and Lista == 3 and Kill1 >= 130 then
		MessageSend(bIndex,0,0,string.format("Ainda bem que você apareceu por aqui. Agora estamos todo mais despreocupados! Tome, vem comemorar!!"))
		SQLQuery("UPDATE "..BD.." SET quest1= 4, "..Mob.."="..MOBKill02..", "..MobKill.."= 0 WHERE Name= '"..Name.."'")
		SQLQuery("UPDATE "..TableChar.." SET "..ColumnReset.."= "..ColumnReset.."+"..RewardReset2.." WHERE "..PlayerReset.."= '"..Name.."'");
		SQLQuery("UPDATE "..TableCoin.." SET "..RewardColumnCoin.."= "..RewardColumnCoin.."+"..RewardCoin2.." WHERE "..PlayerCoin.."= '"..Conta.."'") --// Pagar via WCoin
		SQLFetch()
		SQLClose()
			SetObjectLevelUpPoint(bIndex, (RewardPoint2))
			NoticeSend(bIndex,1,(""..Name..", você Recebeu "..RewardPoint2.." de Status, "..RewardReset2.." de Resets e "..RewardCoin2.." de WCoin !!"))
	
	elseif NPCQuest2 == NPC and Lista == 4 then
		MessageSend(bIndex,0,0,string.format("Obrigada a nós ajudar, agora aquele Castelo está mais seguro. Procure pelo TESTE DE NOME em Lorencia."))
		
end


		  
 end -- RewardType 8


end 
