
-- {{ 

/* MoVie Theater Booking System:
Manages theaters, ticket aVailability, bookings, cancellations, and failed booking attempts.
Validates theater/ticket details, tracks seat aVailability, updates booking status, and maINTains 
cancellation and failure history for auditing.*/
   
-- }} 

-- ================================================================================================================================= --
-- {{                                               DataBase Creation
-- ================================================================================================================================= --


CREATE DATABASE IF NOT EXISTS Theater_Booking_DB;
USE Theater_Booking_DB;                                                                                                                                          

-- }}

-- ================================================================================================================================= --
-- {{                                                   Tables Creation
-- ================================================================================================================================= --

CREATE TABLE Theater (
    Theater_ID INT AUTO_INCREMENT PRIMARY KEY,
    Theater_Name VARCHAR(100) NOT NULL
);


CREATE TABLE Ticket_Info (
    Theater_ID INT,
    Ticket_Type VARCHAR(100) NOT NULL,
    Rate DECIMAL(10 , 2 ) NOT NULL,
    Max_Capacity INT NOT NULL,
    Balance_Capacity INT NOT NULL,
    PRIMARY KEY (Theater_ID , Ticket_Type),
    FOREIGN KEY (Theater_ID)
        REFERENCES Theater (Theater_ID)
);


CREATE TABLE Bookings_Log (
    Booking_ID INT PRIMARY KEY AUTO_INCREMENT,
    Theater_ID INT,
    Ticket_Type VARCHAR(100),
    Quantity INT,
    Price DECIMAL(20 , 2 ),
    Total_Amount DECIMAL(13 , 2 ),
    Booking_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Booking_Status VARCHAR(221),
    FOREIGN KEY (Theater_ID , Ticket_Type)
        REFERENCES Ticket_Info (Theater_ID , Ticket_Type)
);

CREATE TABLE Cancellation_History (
    Booking_ID INT,
    Theater_ID INT,
    Ticket_Type VARCHAR(140),
    Quantity INT,
    Cancelled_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Booking_ID)
        REFERENCES Bookings_Log (Booking_ID)
);

-- }}

-- ================================================================================================================================= --
-- {{                                         Sample Data Insertion.
-- ================================================================================================================================= --

INSERT INTO Theater (Theater_Name) VALUES
('PVR Orion Mall'),
('PVR Nexus Koramangala'),
('PVR Vega City'),
('PVR Phoenix Marketcity'),
('INOX Mantri Square'),
('INOX Lido Mall'),
('INOX Mall of Asia'),
('Cinepolis Lulu Mall'),
('Cinepolis Royal Meenakshi Mall'),
('Cinepolis Nexus Shantiniketan'),
('Gopalan InnoVation Mall'),
('Gopalan Arcade Mall'),
('UrVashi Cinema'),
('Veeresh Cinemas'),
('Victory Cinema'),
('SriniVasa Theatre'),
('Sharada Cinemas'),
('PVR GT World Mall'),
('PVR Soul Space Bellandur'),
('AMB Cinemas');

SELECT* FROM Theater;

INSERT INTO Ticket_Info VALUES
(1,'Silver',180,1200,1200),
(1,'Gold',280,1200,1200),
(1,'Platinum',400,1200,1200),
(1,'VIP',600,1200,1200),
(1,'Recliner',850,1200,1200),

(2,'Silver',170,1200,1200),
(2,'Gold',270,1200,1200),
(2,'Platinum',390,1200,1200),
(2,'VIP',580,1200,1200),
(2,'Recliner',820,1200,1200),

(3,'Silver',160,1200,1200),
(3,'Gold',260,1200,1200),
(3,'Platinum',380,1200,1200),
(3,'VIP',560,1200,1200),
(3,'Recliner',800,1200,1200),

(4,'Silver',190,1200,1200),
(4,'Gold',300,1200,1200),
(4,'Platinum',420,1200,1200),
(4,'VIP',650,1200,1200),
(4,'Recliner',900,1200,1200),

(5,'Silver',175,1200,1200),
(5,'Gold',275,1200,1200),
(5,'Platinum',395,1200,1200),
(5,'VIP',590,1200,1200),
(5,'Recliner',830,1200,1200),

(6,'Silver',165,1200,1200),
(6,'Gold',255,1200,1200),
(6,'Platinum',370,1200,1200),
(6,'VIP',540,1200,1200),
(6,'Recliner',780,1200,1200),

(7,'Silver',185,1200,1200),
(7,'Gold',290,1200,1200),
(7,'Platinum',410,1200,1200),
(7,'VIP',620,1200,1200),
(7,'Recliner',880,1200,1200),

(8,'Silver',180,1200,1200),
(8,'Gold',285,1200,1200),
(8,'Platinum',405,1200,1200),
(8,'VIP',610,1200,1200),
(8,'Recliner',860,1200,1200),

(9,'Silver',170,1200,1200),
(9,'Gold',265,1200,1200),
(9,'Platinum',385,1200,1200),
(9,'VIP',570,1200,1200),
(9,'Recliner',810,1200,1200),

(10,'Silver',200,1200,1200),
(10,'Gold',320,1200,1200),
(10,'Platinum',450,1200,1200),
(10,'VIP',680,1200,1200),
(10,'Recliner',950,1200,1200),

(11,'Silver',190,1200,1200),
(11,'Gold',300,1200,1200),
(11,'Platinum',425,1200,1200),
(11,'VIP',650,1200,1200),
(11,'Recliner',910,1200,1200),

(12,'Silver',175,1200,1200),
(12,'Gold',280,1200,1200),
(12,'Platinum',400,1200,1200),
(12,'VIP',600,1200,1200),
(12,'Recliner',840,1200,1200),

(13,'Silver',165,1200,1200),
(13,'Gold',260,1200,1200),
(13,'Platinum',375,1200,1200),
(13,'VIP',550,1200,1200),
(13,'Recliner',790,1200,1200),

(14,'Silver',185,1200,1200),
(14,'Gold',295,1200,1200),
(14,'Platinum',415,1200,1200),
(14,'VIP',630,1200,1200),
(14,'Recliner',890,1200,1200),

(15,'Silver',195,1200,1200),
(15,'Gold',310,1200,1200),
(15,'Platinum',440,1200,1200),
(15,'VIP',670,1200,1200),
(15,'Recliner',930,1200,1200),

(16,'Silver',150,1200,1200),
(16,'Gold',240,1200,1200),
(16,'Platinum',350,1200,1200),
(16,'VIP',500,1200,1200),
(16,'Recliner',720,1200,1200),

(17,'Silver',180,1200,1200),
(17,'Gold',290,1200,1200),
(17,'Platinum',410,1200,1200),
(17,'VIP',620,1200,1200),
(17,'Recliner',880,1200,1200),

(18,'Silver',160,1200,1200),
(18,'Gold',250,1200,1200),
(18,'Platinum',365,1200,1200),
(18,'VIP',530,1200,1200),
(18,'Recliner',760,1200,1200),

(19,'Silver',175,1200,1200),
(19,'Gold',275,1200,1200),
(19,'Platinum',395,1200,1200),
(19,'VIP',590,1200,1200),
(19,'Recliner',830,1200,1200),

(20,'Silver',185,1200,1200),
(20,'Gold',295,1200,1200),
(20,'Platinum',420,1200,1200),
(20,'VIP',640,1200,1200),
(20,'Recliner',900,1200,1200);
-- }}

SELECT* FROM Ticket_Info;

-- ================================================================================================================================== --
-- {{                                Creating The Stored Procedure For Book A Ticket.
-- ================================================================================================================================== --
									--            Note
									-- This procedure accepts Theater_ID,
									-- Ticket_Type, and Quantity as inputs
									-- and processes one booking request at a time.
-- ================================================================================================================================== --

DELIMITER //

CREATE PROCEDURE Book_Ticket(
IN  P_Theater_ID  INT,
IN  P_Ticket_Type VARCHAR(124),
IN  p_Qty         INT,
OUT p_Booking_ID INT,
OUT p_Result_Message VARCHAR(100)
)

-- }}


-- ================================================================================================================================== --
-- {{                                                  Declaring The Varibales    
-- ================================================================================================================================== --

Proc_Main:                      

BEGIN
	DECLARE V_Theater_Exists  INT;
	DECLARE V_Type            INT;
	DECLARE V_Price           DECIMAL(12,2);
	DECLARE V_AVailable_Seats INT;
	DECLARE V_Amount          DECIMAL(14,2);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
		RESIGNAL;
    END;

-- }}

START TRANSACTION ;

-- {{ Validating the Theater,Ticket Type Existence And Getting The Rate And Balance Capacity.
   
	SET V_Theater_Exists = 0;
    SET V_Type = 0;
    
     
	SELECT  COUNT(*)
 	INTO    V_Theater_Exists
 	FROM    Theater
    WHERE   Theater_ID = P_Theater_ID; 
    
    SELECT  COUNT(*)
 	INTO    V_Type
 	FROM    Ticket_Info
    WHERE   Ticket_Type = P_Ticket_Type 
    AND     Theater_ID = P_Theater_ID;
   
    SELECT  Rate , Balance_Capacity
	INTO    V_Price , V_Available_Seats 
	FROM    Ticket_Info
    WHERE   Ticket_Type = P_Ticket_Type
	AND     Theater_ID = P_Theater_ID;
    
-- }}

-- ================================================================================================================================= --
-- {{                                         Exception Handling Block
-- ================================================================================================================================= --

IF      V_Theater_Exists = 0 
		THEN
        SET P_Result_Message = " Theater Not Found ";
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = P_Result_Message;
        LEAVE Proc_Main;
   
ELSEIF  V_Type = 0
		THEN
        SET P_Result_Message = "Invalid Ticket Type.AVailable Types: SILVER | GOLD | PLATINUM | VIP | RECLINER";
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = P_Result_Message;
        LEAVE Proc_Main;
        
ELSEIF  V_AVailable_Seats = 0 
        THEN
        SET P_Result_Message = "Booking Failed.All Seats Are ReserVed";
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = P_Result_Message;
        LEAVE Proc_Main;
END IF ;

IF      P_Qty <= 0
		THEN
		SET P_Result_Message = " Quantity Must Be Greater Than 0 ";
		SIGNAL SQLSTATE "45000"
		SET MESSAGE_TEXT = P_Result_Message;
		LEAVE Proc_Main; 

ELSEIF V_AVailable_Seats < P_Qty 
        THEN
		SET P_Result_Message = CONCAT("Insufficient Seats.Your Requested Seats Are :",P_QTY,"   ","AVailable Seats Are :",V_AVAILABLE_SEATS); 
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = P_Result_Message;
		LEAVE Proc_Main;
END IF ;

-- }}

       SET V_Amount = V_Price * P_Qty ;

       INSERT INTO Bookings_Log(Theater_ID,Ticket_Type,Quantity,Price,Total_Amount,Booking_Status)Values
                               (P_Theater_ID,P_Ticket_Type,P_Qty,V_Price,V_Amount,"Booked");
                        
		UPDATE Ticket_Info 
		SET    Balance_Capacity = V_AVailable_Seats - p_Qty
		WHERE  Theater_ID = P_Theater_ID
		AND    Ticket_Type = P_Ticket_Type;
                       
                       
       SET P_Booking_ID = LAST_INSERT_ID();

IF      P_Booking_ID > 0 
		THEN
		SELECT CONCAT("Your Booking Was Confirmed Successfully.Booking ID : "," ",P_Booking_id) AS message;
ELSE
		SET P_Result_Message = "Error - Booking Was Failed";
		SIGNAL SQLSTATE "45000"
		SET MESSAGE_TEXT = p_Result_Message;
		LEAVE Proc_Main;
END IF ;

COMMIT ;

END //

DELIMITER ;



-- CALL <procedure name> ( <Theater_ID> , <Ticket_Type> , <Quantity> , @booking_id,@result_message );

CALL Book_Ticket(1,"gold",7,@booking_id,@result_message);    -- Successful Booking
CALL Book_Ticket(123,"gold",80,@booking_id,@result_message);  -- InValid Theater_id
CALL Book_Ticket(1,"3D",80,@booking_id,@result_message);      -- InValid Ticket Type
CALL Book_Ticket(1,"recliner",0,@booking_id,@result_message);     -- 0 Quantity Request
CALL Book_Ticket(1,"gold",-1,@booking_id,@result_message);    -- InValid Requested Quantity
CALL Book_Ticket(1,"gold",820,@booking_id,@result_message);   -- Requesting More Than AVailable


SELECT* FROM Bookings_Log;

-- ================================================================================================================================== --
-- {{                                        CREATING PROCEDURE TO CANCEL A BOOKING
-- ================================================================================================================================== --

-- This procedure accepts a Booking_ID as input and cancels the corresponding booking if it exists.
-- Upon successful cancellation:
-- 1. Booking status is updated to Cancelled.
-- 2. Seat capacity is restored.
-- 3. Cancellation details are logged.


DELIMITER //

CREATE PROCEDURE Cancel_Booking(
IN  P_Booking_ID INT,
OUT P_Result_Message VARCHAR(100)
)

Proc_Main:

BEGIN

	DECLARE V_Booked_ID INT;
    DECLARE V_Booked_Qty INT;
    DECLARE V_Ticket VARCHAR(20);
    DECLARE V_Theater_ID INT;
    DECLARE V_Status varchar(67);
   
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
		RESIGNAL;
    END;
    
START TRANSACTION;
    SET V_Booked_ID = 0;
	SELECT Booking_ID,Theater_ID,Ticket_Type,Quantity,Booking_Status
    INTO   V_Booked_ID,V_Theater_ID,V_Ticket,V_Booked_Qty,V_Status
    FROM   Bookings_Log 
    Where  Booking_ID = P_Booking_ID;
    
IF  V_Booked_ID = 0 
    THEN
    SET P_Result_Message = "Booking ID Not Found";
    SIGNAL SQLSTATE "45000"
    SET MESSAGE_TEXT = P_Result_Message;
    LEAVE Proc_Main;
    
ELSEIF V_Status = "Cancelled" 
    THEN
    SET P_Result_Message = "Your Booking Has Been Already Cancelled";
    SIGNAL SQLSTATE "45000"
    SET MESSAGE_TEXT = P_Result_Message;
    Leave Proc_Main;
END IF;

   INSERT INTO Cancellation_History(Booking_ID,Theater_ID,Ticket_Type,Quantity)VALUES
                                   (P_Booking_ID,V_Theater_ID,V_Ticket,V_Booked_Qty);
                                   
UPDATE Ticket_Info 
SET    Balance_Capacity = Balance_Capacity + V_Booked_Qty
WHERE  Theater_ID = V_Theater_ID
AND    Ticket_Type = V_Ticket;
    
UPDATE Bookings_Log 
SET    Booking_Status = 'Cancelled'
WHERE  Booking_ID = P_Booking_ID;

COMMIT;
    
SELECT 'Your booking has been cancelled successfully.' AS message;
    
END //
DELIMITER ;

-- }}

-- {{ CALL <procedure name> (<P_Booking_ID>,<@Result_Message>);
	
CALL Cancel_Booking(1,@result_message); -- Valid Booking ID (Already Exists In The Booking Table)
CALL Cancel_Booking(1,@result_message); -- Trying To Delete Again The Already Deleted Booking ID. 
CALL Cancel_Booking(-11,@result_message); -- InValid Booking ID

SELECT* FROM Bookings_Log;

SELECT* FROM Cancellation_History;

SELECT* FROM Ticket_Info;





-- ====================================================================================================================================
--                                 Theater Ticket Booking System Analytics                                                           --
-- ====================================================================================================================================

-- 1.Display all bookings made today.

SELECT * FROM Bookings_Log
WHERE Booking_Date = CURRENT_DATE();

-- ---------------------------------------------------------------------------------------------------- --

-- 2.Find the total number of bookings made.

SELECT COUNT(*) AS Total_Bookings FROM Bookings_Log
Where  Booking_Status = "Booked";

-- ----------------------------------------------------------------------------------------------------- --

-- 3.Show all successful bookings.

SELECT * FROM Bookings_Log
WHERE  Booking_Status = "Booked";

-- ----------------------------------------------------------------------------------------------------- --

-- 4.Find the total revenue generated.

SELECT 
    SUM(Total_Amount) AS Total_Revenue
FROM
    Bookings_Log;

-- ----------------------------------------------------------------------------------------------------- --

-- 5.Display all theaters and their ticket types.

SELECT 
    T.Theater_ID, T.Theater_Name, TI.Ticket_Type
FROM
    Theater T
        INNER JOIN
    Ticket_Info TI ON T.Theater_ID = TI.Theater_ID; 
    
-- ----------------------------------------------------------------------------------------------------- --

-- 6.Find the total tickets booked for each theater.

SELECT 
    T.Theater_Name, SUM(B.Quantity) AS Total_Tickets_Booked
FROM
    Theater T
        INNER JOIN
    Bookings_Log B ON T.Theater_ID = B.Theater_Id
GROUP BY Theater_Name;

-- ----------------------------------------------------------------------------------------------------- --

-- 7.Show all bookings where quantity is greater than 5.

SELECT * FROM Bookings_Log
WHERE Quantity > 5;

-- ----------------------------------------------------------------------------------------------------- --

-- 8.Find the highest ticket price among all ticket types.

SELECT 
    Theater_ID,Ticket_Type, MAX(Rate) AS Highest_Ticket_Price
FROM
    Ticket_Info
GROUP BY Ticket_Type,Theater_ID
ORDER BY Highest_Ticket_Price DESC
LIMIT 1;

-- ----------------------------------------------------------------------------------------------------- --

-- 9.Display all theaters that have VIP tickets.

SELECT 
    T.Theater_Name, Ticket_Type
FROM
    Theater T
        LEFT JOIN
    Ticket_Info TI ON T.Theater_ID = TI.Theater_ID
WHERE
    Ticket_Type = 'VIP';
    
-- ----------------------------------------------------------------------------------------------------- --

-- 10.Find the total available seats for each theater.

SELECT 
    T.Theater_Name, 
    SUM(TI.Balance_Capacity) AS Available_Seats
FROM
    Theater T
INNER JOIN
    Ticket_Info TI ON T.Theater_ID = TI.Theater_Id
GROUP BY Theater_Name;

-- ----------------------------------------------------------------------------------------------------- --

-- 11.Find total revenue generated by each theater.

SELECT 
      T.Theater_Name, 
      SUM(B.Total_Amount) AS Total_Revenue
FROM
      Theater T
INNER JOIN
      Bookings_Log B ON T.Theater_ID = B.Theater_ID
GROUP BY 
      Theater_Name;

-- ----------------------------------------------------------------------------------------------------- --

-- 12.Find total revenue generated by each ticket type.

SELECT 
      T.Ticket_Type, 
      SUM(B.Total_Amount) AS Total_Revenue
FROM
      Ticket_Info T
INNER JOIN
      Bookings_Log B ON T.Theater_ID = B.Theater_ID
	 and T.ticket_type = b.ticket_type

GROUP BY 
      Ticket_Type;
      
-- ----------------------------------------------------------------------------------------------------- --

-- 13.Display the top 5 theaters by revenue.

SELECT 
      T.Theater_Name, 
      SUM(B.Total_Amount) AS Total_Revenue
FROM
     Theater T
INNER JOIN
     Bookings_Log B ON T.Theater_Id = B.Theater_Id
GROUP BY Theater_Name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- ----------------------------------------------------------------------------------------------------- --

-- 14.Find the most booked ticket type.

SELECT 
    Ticket_Type, SUM(Quantity) AS Most_Bookings
FROM
    Bookings_Log
GROUP BY Ticket_Type
ORDER BY Most_Bookings DESC
LIMIT 1;

-- ----------------------------------------------------------------------------------------------------- --

-- 15.Find the least booked ticket type.

SELECT 
    Ticket_Type, SUM(Quantity) AS Least_Bookings
FROM
    Bookings_Log
GROUP BY Ticket_Type
ORDER BY Least_Bookings ASC
LIMIT 1;

-- ----------------------------------------------------------------------------------------------------- --

-- 16.Calculate average booking amount per theater.

SELECT 
		T.Theater_Name,
		ROUND(AVG(B.Total_Amount)) AS Avg_Booking_Amount
FROM
        Theater T
INNER JOIN
        Bookings_Log B ON T.Theater_ID = B.Theater_ID
GROUP BY 
        Theater_Name;

-- ----------------------------------------------------------------------------------------------------- --

-- 17.Find theaters with more than 100 bookings.

SELECT 
      T.Theater_Name, 
      SUM(B.Quantity) AS Total_Bookings
FROM
      Bookings_Log B
INNER JOIN
      Theater T ON T.Theater_Id = B.Theater_ID
GROUP BY 
      Theater_Name
HAVING 
      Total_Bookings > 100;
       
-- ----------------------------------------------------------------------------------------------------- --

-- 18.Show total tickets cancelled by theater.

SELECT 
      T.Theater_Name,
      SUM(B.Quantity) AS Cancelled_TicketCount
FROM   
     Bookings_Log B
INNER JOIN 
     Theater T ON T.Theater_ID = B.Theater_Id
WHERE  
     Booking_Status = "Cancelled"
GROUP BY 
	 Theater_Name;

-- ----------------------------------------------------------------------------------------------------- --

-- 19.Find the theater with the highest number of cancellations.

SELECT 
    T.Theater_Name, 
    COUNT(*) AS Cancellations
FROM
    Cancellation_History C
INNER JOIN
    Theater T ON T.Theater_ID = C.Theater_ID
GROUP BY Theater_Name
ORDER BY COUNT(Cancelled_At) DESC
LIMIT 1;

-- ----------------------------------------------------------------------------------------------------- --

-- 20.Find booking count and cancellation count for each theater.

SELECT Theater_ID,
       SUM(CASE WHEN Booking_Status = 'Booked' THEN 1 ELSE 0 END) AS Total_Booked,
       SUM(CASE WHEN Booking_Status = 'Cancelled' THEN 1 ELSE 0 END) AS Total_Cancelled
FROM Bookings_Log
GROUP BY Theater_ID;

-- ----------------------------------------------------------------------------------------------------- --

-- 21.Display Theater Name, Ticket Type, Quantity, and Total Amount for all bookings.

SELECT T.Theater_Name,TI.Ticket_Type,B.Quantity,B.Total_Amount
FROM   Bookings_Log B
INNER JOIN Ticket_Info TI ON B.Theater_ID = TI.Theater_ID
AND B.Ticket_Type = TI.Ticket_Type
INNER JOIN Theater T ON T.Theater_ID = B.Theater_ID;

-- ----------------------------------------------------------------------------------------------------- --

-- 22.Show all cancellations with theater names.

SELECT 
      T.Theater_Name, 
      B.Booking_Status
FROM
      Theater T
INNER JOIN
      Bookings_Log B ON T.Theater_ID = B.Theater_ID
WHERE
    Booking_Status = 'Cancelled';
    
-- ----------------------------------------------------------------------------------------------------- --

-- 23.Find total revenue for each theater name.

SELECT 
      T.Theater_Name, 
      SUM(B.Total_Amount) AS Total_Revenue
FROM
      Theater T
INNER JOIN
      Bookings_Log B ON T.Theater_ID = B.Theater_ID
GROUP BY 
      Theater_Name
ORDER BY 
      Total_Revenue DESC;

-- ----------------------------------------------------------------------------------------------------- --

-- 24.Display ticket rates along with theater names.

SELECT 
     T.Theater_Name, TI.Ticket_Type, TI.Rate
FROM
    Theater T
INNER JOIN
    Ticket_Info TI ON T.Theater_ID = TI.Theater_ID;
    
-- ----------------------------------------------------------------------------------------------------- --

-- 25.Show bookings and corresponding ticket rates.

SELECT 
    B.Booking_ID,
    B.Theater_ID,
    B.Ticket_Type,
    B.Quantity,
    TI.Rate,
    B.Total_Amount,
    B.Booking_Date,
    B.Booking_Status
FROM
    Bookings_Log B
INNER JOIN
    Ticket_Info TI ON B.Theater_ID = TI.Theater_ID
AND B.Ticket_Type = TI.Ticket_Type
WHERE
    Booking_Status = 'Booked'; 

-- ----------------------------------------------------------------------------------------------------- --

-- 26.Find theaters generating revenue greater than ₹50,000.

SELECT 
    T.Theater_Name, 
    SUM(B.Total_Amount) AS Total_Revenue
FROM
    Bookings_Log B
INNER JOIN
    Theater T ON B.Theater_ID = T.Theater_Id
GROUP BY 
   Theater_Name
HAVING Total_Revenue > 50000;

-- ----------------------------------------------------------------------------------------------------- --

-- 27.Find ticket types with more than 100 tickets booked.

SELECT 
    Ticket_Type, 
    SUM(Quantity) AS Total_bookings
FROM
    Bookings_Log
GROUP BY Ticket_Type
HAVING Total_bookings > 100;

-- ----------------------------------------------------------------------------------------------------- --

-- 28.Find theaters having more than 10 cancellations.

SELECT 
    T.Theater_Name, 
    COUNT(B.Booking_Status) AS Cancellations
FROM
    Bookings_Log B
INNER JOIN
    Theater T ON B.Theater_ID = T.Theater_ID
WHERE
    Booking_Status = 'Cancelled'
GROUP BY Theater_Name
HAVING Cancellations > 10;

SELECT 
    T.Theater_Name, COUNT(C.Theater_ID) AS cancellations
FROM
    Theater T
INNER JOIN
    Cancellation_History C ON T.Theater_ID = C.Theater_ID
GROUP BY Theater_Name
HAVING cancellations > 10;

-- ----------------------------------------------------------------------------------------------------- --

-- 29.Find theaters where average booking quantity exceeds 5.

SELECT 
    T.Theater_Name, 
    AVG(B.Quantity) Avg_Bookings
FROM
    Bookings_Log B
INNER JOIN
    Theater T ON B.Theater_ID = T.Theater_ID
GROUP BY Theater_Name
HAVING Avg_Bookings > 5;

-- ----------------------------------------------------------------------------------------------------- --

-- 30.Find ticket types generating revenue above ₹1,00,000.

SELECT 
      Ticket_Type, 
      SUM(Total_Amount) AS Total_Revenue
FROM
      Bookings_Log
GROUP BY 
      Ticket_Type
HAVING 
      Total_Revenue > 100000
ORDER BY 
     Total_Revenue DESC;
     
-- ----------------------------------------------------------------------------------------------------- --

-- 31.Find the theater with the highest revenue.

SELECT 
    T.Theater_Name, 
    SUM(B.Total_Amount) AS Highest_Revenue
FROM
    Bookings_Log B
INNER JOIN
    Theater T ON B.Theater_ID = T.Theater_ID
GROUP BY Theater_Name
ORDER BY Highest_Revenue DESC
LIMIT 1;

-- ----------------------------------------------------------------------------------------------------- --

-- 32.Find the ticket type with the maximum bookings.

SELECT 
    Ticket_Type, 
    SUM(Quantity) Total_Bookings
FROM
    Bookings_Log
GROUP BY Ticket_Type
ORDER BY Total_Bookings DESC
LIMIT 1;

-- ----------------------------------------------------------------------------------------------------- --

-- 33.Find theaters whose revenue is above average revenue.

SELECT  T.Theater_Name, SUM(B.Total_Amount) Total_Revenuue                  
FROM    Theater T
INNER JOIN Bookings_Log B 
ON B.Theater_ID = T.Theater_ID
GROUP BY T.Theater_Name
HAVING SUM(b.total_amount) > (SELECT AVG(Total_Amount) FROM Bookings_Log B);

-- ----------------------------------------------------------------------------------------------------- --

-- 34.Find bookings whose amount is greater than average booking amount.

SELECT    Booking_id,
          Total_Amount AS Total_Amount
FROM 
          Bookings_Log
WHERE 
          Total_Amount > (SELECT AVG(Total_Amount) FROM Bookings_log);

-- ----------------------------------------------------------------------------------------------------- --

-- 35.Find theaters with maximum cancellations.

SELECT T.Theater_ID,T.Theater_Name,COUNT(C.Cancelled_At) AS Total_Cancellations
FROM   Cancellation_History C 
INNER JOIN Theater T ON C.Theater_ID = T.Theater_ID 
GROUP BY Theater_Name,Theater_ID
ORDER BY Total_Cancellations DESC;

-- ----------------------------------------------------------------------------------------------------- --

-- 36.Rank theaters based on revenue.

SELECT 
       T.Theater_Name,
       SUM(B.Total_Amount) AS Total_Revenue,
       DENSE_RANK() OVER ( ORDER BY SUM(B.Total_Amount) DESC ) AS Theater_Rank
FROM   Bookings_Log B 
INNER JOIN Theater T ON T.Theater_ID = B.Theater_ID
GROUP BY Theater_Name;

-- ----------------------------------------------------------------------------------------------------- --

-- 37.Find top 3 revenue-generating theaters.

SELECT 
       T.Theater_Name,
       SUM(B.Total_Amount) AS Total_Revenue,
       DENSE_RANK() OVER ( ORDER BY SUM(B.Total_Amount) DESC ) AS Theater_Rank
FROM   Bookings_Log B 
INNER JOIN Theater T ON T.Theater_ID = B.Theater_ID
GROUP BY Theater_Name
ORDER BY Total_Revenue DESC
LIMIT 3;

-- ----------------------------------------------------------------------------------------------------- --

-- 38.Rank ticket types based on booking quantity.

SELECT Ticket_Type,
       SUM(Quantity) AS Total_Qty,
       DENSE_RANK() OVER (ORDER BY SUM(Quantity) DESC) AS Rank_
FROM
	   Bookings_Log
GROUP BY
      Ticket_Type;
      
-- ----------------------------------------------------------------------------------------------------- --

-- 39.Find previous booking amount using LAG().

SELECT 
       Booking_id,
       Total_Amount,
       LAG(Total_Amount) OVER ( ORDER BY Booking_ID ASC) AS Previous_Booking_Amount
FROM
      Bookings_Log;

-- ----------------------------------------------------------------------------------------------------- --





