DELIMITER //
CREATE TRIGGER lagerstatus 
after UPDATE ON skor
FOR EACH ROW
BEGIN
   IF new.totalt_i_lager=0 THEN
		call getTodaysDate(@today);
        insert into slutilager (skor_id, datum)
		VALUES(new.id,@today);
   END IF;
END //
DELIMITER ;