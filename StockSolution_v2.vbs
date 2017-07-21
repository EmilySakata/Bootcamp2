' stocksolution_v2

Sub WallStreet():

Dim i As Long
Dim j As Integer
Dim rowCount As Long
Dim days As Integer
Dim avg_change As Single
Dim daily_change As Single
Dim total_change AS Single
Dim per_change As Single
Dim start As Long
Dim total As Double
Dim sheet1 As Worksheet
Dim sheet2 As Worksheet


' Set sheet1 = Worksheets("Stock_data_2016.csv")
Set sheet2 = Worksheets("Results")

i = 1
j = 0
days = 0
start = 2
avg_day = 0
total = 0
total_change = 0



' print the header values'
' Prints the following lables in a new worksheet called "Results":
sheet2.Range("A1") = "Ticker"
sheet2.Range("B1") = "Total Change"
sheet2.Range("C1") = "% of Change"
sheet2.Range("D1") = "Avg. Daily Change"
sheet2.Range("E1") = "Total Vol."

sheet2.Range("G2") = "Greatest Volume"
sheet2.Range("G5") = "Greatest % Increase"
sheet2.Range("G8") = "Greatest % Decr."
sheet2.Range("G11") = "Greatest Avg. Change"


'identify the number of rows in the sheet'
rowCount = Cells(Rows.Count, "A").End(xlUp).Row


' Assume that the csv file can be sorted out by ticker name in assending order.

' Prints the following:

For i = 2 To rowCount
        If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then

' The ticker symbol in column A
        sheet2.Cells(j + 2, 1).Value =Cells(i, 1).Value
' Total change in the stock in column B
       	total_change =  (Cells(i, 6).Value - Cells(start, 3).Value)
       	sheet2.Cells(j + 2, 2).Value = Round(total_change, 2)
' The Percent of change in column C
 		per_change = Round((total_change / Cells(start, 3)) * 100, 2)
        sheet2.Cells(j + 2, 3).Value = "%" & per_change
' Average Daily change in column D
        
        daily_change = daily_change + (Cells(i, 4).Value - Cells(i, 5).Value)
        days = (i - start) + 1
        avg_change = daily_change / days
        sheet2.Cells(j + 2, 4).Value = avg_change
        
' Total volume of trade in column E
        sheet2.Cells(j + 2, 5).Value = total + Cells(i, 7).Value
' The total change in stock should be red if there is a loss and green for a gain.

        Select Case total_change
        	Case Is > 0
        		sheet2.Cells(j + 2, 2).Interior.ColorIndex = 4
        	Case Is < 0
        		sheet2.Cells(j + 2, 2).Interior.ColorIndex = 3
        	Case Else
        		sheet2.Cells(j + 2, 2).Interior.ColorIndex = 0
        End Select
        

'Reset the value to be used for the next ticker value'
        avg_day = 0
        daily_change = 0
        days = 0
        total = 0
        start = i + 1
        j = j + 1
        

        Else
' Accumulate the value during same ticker value
' Average Daily change in column D
      daily_change = daily_change + (Cells(i, 4).Value - Cells(i, 5).Value)
        
' Total volume of trade in column E
        total = total + (Cells(i, 7).Value)



        End If
Next i
' On the same worksheet, the following should also be printed:


' Use the function to find min / Max
sheet2.Cells(2, 8) = WorksheetFunction.Max(sheet2.Range("E2:E" & rowCount))
sheet2.Cells(5, 8) = "%" & WorksheetFunction.Max(sheet2.Range("C2:C" & rowCount))
sheet2.Cells(8, 8) = "%" & WorksheetFunction.Min(sheet2.Range("C2:C" & rowCount))
sheet2.Cells(11, 8) = WorksheetFunction.Max(sheet2.Range("D2:D" & rowCount))



End Sub


