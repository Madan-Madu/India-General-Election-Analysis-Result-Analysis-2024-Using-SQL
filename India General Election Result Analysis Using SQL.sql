 
 --INDIA GENERAL ELECTION ANALYSIS RESULT ANALYSIS 2024
 
 
 --Total Seats

SELECT 
DISTINCT COUNT(Parliament_Constituency) AS Total_Seats
FROM constituencywise_results


 --What are the total number of seats available for elections in each states

 SELECT 
 s.State AS State_name,
 Count(cr.Parliament_Constituency) AS Total_Seats
 FROM
 constituencywise_results cr
 INNER JOIN Statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
 INNER JOIN States s on sr.State_id = s.state_id
 GROUP BY s.State


  --Total Seats Won by NDA Alliance
  SELECT 
	SUM(CASE
			WHEN party IN (
			'Bharatiya Janata Party - BJP',
			'Telugu Desam - TDP',
			'Janata Dal  (United) - JD(U)',
			'Shiv Sena - SHS',
			'AJSU Party - AJSUP',
			'Asom Gana Parishad - AGP',
			'Apna Dal (Soneylal) - ADAL',
			'Hindustani Awam Morcha (Secular) - HAMS',
			'Janasena Party - JnP',
			'Janata Dal  (Secular) - JD(S)',
			'Lok Janshakti Party(Ram Vilas) - LJPRV',
			'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
			'Rashtriya Loktantrik Party - RLTP',
			'Sikkim Krantikari Morcha - SKM'
			) THEN [WON]
		   ELSE 0
	     END) AS NDA_Total_Seats_Won
FROM
	partywise_results

 --Seats won by NDA Alliance Parties

SELECT 
	  party AS Party_Name,
	  won AS Seats_Won

FROM partywise_results

WHERE
	 party IN(
			'Bharatiya Janata Party - BJP',
			'Telugu Desam - TDP',
			'Janata Dal  (United) - JD(U)',
			'Shiv Sena - SHS',
			'AJSU Party - AJSUP',
			'Asom Gana Parishad - AGP',
			'Apna Dal (Soneylal) - ADAL',
			'Hindustani Awam Morcha (Secular) - HAMS',
			'Janasena Party - JnP',
			'Janata Dal  (Secular) - JD(S)',
			'Lok Janshakti Party(Ram Vilas) - LJPRV',
			'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
			'Rashtriya Loktantrik Party - RLTP',
			'Sikkim Krantikari Morcha - SKM'
			) 
ORDER BY Seats_Won DESC

SELECT * FROM  partywise_results

 --Total Seats won by I.N.D.I.A. Alliance

 SELECT
		SUM(CASE
				WHEN party IN (
				'Indian National Congress - INC',
				'Aam Aadmi Party - AAAP',
				'All India Trinamool Congress - AITC',
				'Bharat Adivasi Party - BHRTADVSIP',
				'Communist Party of India - CPI',
				'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
        		'Communist Party of India  (Marxist) - CPI(M)',
				'Dravida Munnetra Kazhagam - DMK',
				'Indian Union Muslim League - IUML',
				'Jammu & Kashmir National Conference - JKN',
				'Jharkhand Mukti Morcha - JMM',
				'Kerala Congress - KEC',
				'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
				'Rashtriya Janata Dal - RJD',
				'Rashtriya Lok Dal - RLD',
				'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
				'Revolutionary Socialist Party - RSP',
				'Samajwadi Party - SP',
				'Shiv Sena - SHS',
				'Viduthalai Chiruthaigal Katchi - VCK'
			)THEN [WON]
			ELSE 0
		  END) AS India_Total_Seats_Won
FROM 
	partywise_results


 --Seats won by I.N.D.I.A. Alliance Parties


  SELECT
		Party,
		won FROM partywise_results
WHERE party IN (
				'Indian National Congress - INC',
				'Aam Aadmi Party - AAAP',
				'All India Trinamool Congress - AITC',
				'Bharat Adivasi Party - BHRTADVSIP',
				'Communist Party of India - CPI',
				'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
        		'Communist Party of India  (Marxist) - CPI(M)',
				'Dravida Munnetra Kazhagam - DMK',
				'Indian Union Muslim League - IUML',
				'Jammu & Kashmir National Conference - JKN',
				'Jharkhand Mukti Morcha - JMM',
				'Kerala Congress - KEC',
				'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
				'Rashtriya Janata Dal - RJD',
				'Rashtriya Lok Dal - RLD',
				'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
				'Revolutionary Socialist Party - RSP',
				'Samajwadi Party - SP',
				'Shiv Sena - SHS',
				'Viduthalai Chiruthaigal Katchi - VCK'
			)
ORDER BY won DESC


 --Add new column field in table partywise_results to get the party alliance as NDA, I.N.D.I.A and other
 
 ALTER TABLE partywise_results
 ADD party_alliance VARCHAR(50)

 UPDATE partywise_results
 SET party_alliance = 'I.N.D.I.A'
 WHERE party IN (
				'Indian National Congress - INC',
				'Aam Aadmi Party - AAAP',
				'All India Trinamool Congress - AITC',
				'Bharat Adivasi Party - BHRTADVSIP',
				'Communist Party of India - CPI',
				'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
        		'Communist Party of India  (Marxist) - CPI(M)',
				'Dravida Munnetra Kazhagam - DMK',
				'Indian Union Muslim League - IUML',
				'Jammu & Kashmir National Conference - JKN',
				'Jharkhand Mukti Morcha - JMM',
				'Kerala Congress - KEC',
				'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
				'Rashtriya Janata Dal - RJD',
				'Rashtriya Lok Dal - RLD',
				'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
				'Revolutionary Socialist Party - RSP',
				'Samajwadi Party - SP',
				'Shiv Sena - SHS',
				'Viduthalai Chiruthaigal Katchi - VCK'
);

UPDATE partywise_results
SET party_alliance = 'NDA'
WHERE party IN (
			'Bharatiya Janata Party - BJP',
			'Telugu Desam - TDP',
			'Janata Dal  (United) - JD(U)',
			'Shiv Sena - SHS',
			'AJSU Party - AJSUP',
			'Asom Gana Parishad - AGP',
			'Apna Dal (Soneylal) - ADAL',
			'Hindustani Awam Morcha (Secular) - HAMS',
			'Janasena Party - JnP',
			'Janata Dal  (Secular) - JD(S)',
			'Lok Janshakti Party(Ram Vilas) - LJPRV',
			'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
			'Rashtriya Loktantrik Party - RLTP',
			'Sikkim Krantikari Morcha - SKM'
); 

SELECT * FROM partywise_results

 --Winning candidate's name, there party name, total votes, and the margin of victory for a specific state and constituency


 SELECT
 cr.Winning_Candidate,
 pr.party,
 pr.party_alliance,
 cr.total_votes,
 cr.margin,
 s.state,
 cr.Constituency_Name
 FROM
 constituencywise_details cr INNER JOIN partywise_results pr ON cr.party_id = pr.party_id
 INNER JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
 INNER JOIN states s ON sr.State_ID = s.State_ID
 WHERE cr.Constituency_Name = 'BARAMATI'


 --What is the disribution of EVM Votes versus postal votes for a candidates in a specific constituency

 SELECT
 cd.EVM_Votes,
 cd.Postal_votes,
 cd.Total_votes,
 cd.Candidate,
 cr.Constituency_Name
 FROM constituencywise_results cr JOIN constituencywise_details cd
 ON cr.Constituency_ID = cd.Constituency_ID
 where cr.Constituency_Name = 'AMETHI'


  --Which Parties have won the most seates in a state, and how many seats did each party win?

  SELECT
   p.Party,
   COUNT(cr.Constituency_ID) AS Seats_won
FROM
	Constituencywise_results cr
JOIN
	partywise_results p ON cr.party_ID = p.party_ID
JOIN
	Statewise_results sr ON cr.Parliament_constituency = sr.Parliament_constituency
JOIN
	States s ON sr.State_ID = s.State_ID
WHERE
	s.state = 'Karnataka'
GROUP BY
	p.Party
ORDER BY
	Seats_won DESC;