CREATE DATABASE IF NOT EXISTS gestao_torneios; 
USE gestao_torneios;

CREATE TABLE Equipas ( 
ID_Equipa INT AUTO_INCREMENT PRIMARY KEY, 
Nome_Equipa VARCHAR(100) NOT NULL, 
Data_Criacao DATE NOT NULL 
);

CREATE TABLE Jogadores ( 
ID_Jogador INT AUTO_INCREMENT PRIMARY KEY, 
Nome VARCHAR(100) NOT NULL, 
Nickname VARCHAR(50) NOT NULL, 
Data_Nascimento DATE NOT NULL, 
ID_Equipa INT NOT NULL, 
FOREIGN KEY (ID_Equipa) 
REFERENCES Equipas(ID_Equipa) 
);

CREATE TABLE Torneios ( 
ID_Torneio INT AUTO_INCREMENT PRIMARY KEY, 
Nome VARCHAR(100) NOT NULL, 
Data_Inicio DATE NOT NULL, 
Premio_Monetario DECIMAL(10,2) NOT NULL, 
CHECK (Premio_Monetario >= 0) 
); 

CREATE TABLE Participacoes ( 
ID_Equipa INT NOT NULL, 
ID_Torneio INT NOT NULL, 
PRIMARY KEY (ID_Equipa, ID_Torneio), 
FOREIGN KEY (ID_Equipa) 
REFERENCES Equipas(ID_Equipa), 
FOREIGN KEY (ID_Torneio) 
REFERENCES Torneios(ID_Torneio) 
); 

INSERT INTO Equipas (ID_Equipa, Nome_Equipa, Data_Criacao) VALUES 
('1','Campinho', '1999-01-01'),
('2', 'ALBA', '2000-01-01');

INSERT INTO Jogadores (Nome, Nickname, Data_Nascimento,ID_Equipa) VALUES 
('Tomás', 'Tomasoto', '2008-09-25','1'),
('Rodrigo', 'Pereira', '2008-12-13','2');

INSERT INTO Torneios (ID_Torneio, Nome, Data_Inicio, Premio_Monetario) VALUES 
('1','Torneio da Picanha', '2026-11-1','200'),
('2','Torneio dos minis', '2027-06-10','50'),
('3', 'Torneio da Primavera', '2027-04-05', '500');


INSERT INTO Participacoes (ID_Equipa, ID_Torneio) VALUES 
('1','2'),
('2','3'),
('2','2'),
('1', '3');


SELECT * FROM Jogadores ORDER BY Nome ASC;


SELECT j.Nome AS Nome_Jogador, e.Nome_Equipa FROM Jogadores j JOIN Equipas e ON j.ID_Equipa = e.ID_Equipa;


SELECT e.Nome_Equipa, COUNT(j.ID_Jogador) AS Total_Jogadores FROM Equipas e JOIN Jogadores j ON e.ID_Equipa = j.ID_Equipa GROUP BY e.ID_Equipa, e.Nome_Equipa HAVING COUNT(j.ID_Jogador) > 1;


SELECT e.Nome_Equipa, COUNT(j.ID_Jogador) AS Total_Jogadores FROM Equipas e LEFT JOIN Jogadores j ON e.ID_Equipa = j.ID_Equipa GROUP BY e.ID_Equipa, e.Nome_Equipa ORDER BY Total_Jogadores DESC;


SELECT t.Nome AS Nome_Torneio, t.Premio_Monetario, COUNT(p.ID_Equipa) AS Total_Equipas FROM Torneios t JOIN Participacoes p ON t.ID_Torneio = p.ID_Torneio GROUP BY t.ID_Torneio, t.Nome, t.Premio_Monetario;




