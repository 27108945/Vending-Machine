
(deffunction change (?total)
        (if (< ?total 0) then
        (printout t "Your change : R " (* ?total -1) crlf
         "Thanks for your support" crlf)
        else
        (printout t "Thaks for your support" crlf)))

(deffunction inputCoins (?total)
        (while (> ?total 0)    
        (bind ?coin (read))
        (if(eq ?coin R5) then
                (bind ?total (- ?total 5.00)))
        (if(eq ?coin R2) then
                (bind ?total (- ?total 2.00)))
        (if(eq ?coin R1) then
                (bind ?total (- ?total 1.00)))
        (if(eq ?coin c50) then
                (bind ?total (- ?total 0.50)))
        (if(eq ?coin c20) then
                (bind ?total (- ?total 0.20)))
        (if(eq ?coin c10) then
                (bind ?total (- ?total 0.10)))
        (if(> ?total 0) then
        (printout t "You need R " ?total "0" crlf)))
        (change ?total))

(deffunction inputItem ()
        (bind ?item (read))
        (if(eq ?item CH) then
        (bind ?total 15.00))
        (if(eq ?item CO) then
        (bind ?total 8.50))
        (if(eq ?item OR) then
        (bind ?total 10.00))
        (if(eq ?item SW) then
        (bind ?total 12.50))
        (printout t "You need R " ?total "0" crlf)
        (printout t "Input R5, R2, R1, c50, c20, c10" crlf
                "Input : " )
        (inputCoins ?total))

(deftemplate chocolate(slot price))
(deftemplate cola(slot price))
(deftemplate orange (slot price))
(deftemplate sweets(slot price))

(deffacts ItemPrices
        (chocolate (price 15.00))
        (cola (price 8.50))
        (orange (price 10.00))
        (sweets (price 12.50)))

(defrule print
        =>
        (printout t "Choose one of the following : " crlf
                "CH = chocolate" crlf
                "CO = cola" crlf
                "OR = orange" crlf
                "SW = sweets" crlf
                "choice : ")
        (inputItem))
