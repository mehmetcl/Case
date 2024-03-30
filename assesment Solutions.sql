
--1


CREATE TABLE test_groups (
    name VARCHAR(40) NOT NULL,
    test_value INTEGER NOT NULL,
    UNIQUE(name)
);

CREATE TABLE test_cases (
    id INTEGER NOT NULL,
    group_name VARCHAR(40) NOT NULL,
    status VARCHAR(5) NOT NULL,
    UNIQUE(id)
);

INSERT INTO test_groups (name, test_value) VALUES 
('performance', 15),
('corner cases', 10),
('numerical stability', 20),
('memory usage', 10);

INSERT INTO test_cases (id, group_name, status) VALUES
(13, 'memory usage', 'OK'),
(14, 'numerical stability', 'OK'),
(15, 'memory usage', 'ERROR'),
(16, 'numerical stability', 'OK'),
(17, 'numerical stability', 'OK'),
(18, 'performance', 'ERROR'),
(19, 'performance', 'ERROR'),
(20, 'memory usage', 'OK'),
(21, 'numerical stability', 'OK');


SELECT tg.name AS name,
COUNT(tc.group_name) AS all_test_cases , 
SUM(CASE WHEN tc.status = 'OK' THEN 1 ELSE 0 END) AS passed_test_ceses,
SUM(CASE WHEN tc.status='OK' THEN tg.test_value ELSE 0 END) AS total_value
FROM test_groups tg LEFT JOIN test_cases tc ON tg.name=tc.group_name  GROUP BY tg.name ORDER BY total_value DESC , name;



--2

DROP TABLE test_groups;
DROP TABlE test_cases;

CREATE TABLE test_groups (
    name VARCHAR(40) NOT NULL,
    test_value INTEGER NOT NULL,
    UNIQUE(name)
);

CREATE TABLE test_cases (
    id INTEGER NOT NULL,
    group_name VARCHAR(40) NOT NULL,
    status VARCHAR(5) NOT NULL,
    UNIQUE(id)
);


INSERT INTO test_groups (name, test_value) VALUES 
('performance', 15),
('corner cases', 10),
('numerical stability', 20),
('memory usage', 10),
('partial functionality', 20),
('full functionality', 40);

INSERT INTO test_cases (id, group_name, status) VALUES
(1, 'performance', 'ERROR'),
(2, 'full functionality', 'ERROR');

SELECT tg.name AS name,
COUNT(tc.group_name) AS all_test_cases , 
SUM(CASE WHEN tc.status = 'OK' THEN 1 ELSE 0 END) AS passed_test_ceses,
SUM(CASE WHEN tc.status='OK' THEN tg.test_value ELSE 0 END) AS total_value
FROM test_groups tg LEFT JOIN test_cases tc ON tg.name=tc.group_name  GROUP BY tg.name ORDER BY total_value DESC , name;



