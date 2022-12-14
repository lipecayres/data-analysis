### SIX SIGMA DATA ANALISYS
### COOKIES INDUSTRIAL PRODUCTION
### 

### TAGUCHI LOSS FUNCTION ANALISYS

require(SixSigma)
require(qcc)

#Setting variables
      # Target
y0 <- 0.136

      # Delta variation
delta <- 0.05

      # Cost of loss ($)
L0 <- 0.0051

      # Constant K
k= L0/delta


# Inputing data
weight_loss <- c(0.1418, 0.1385, 0.1402, 0.1415, 0.1371, 0.1463, 0.1391, 0.1311, 0.1463, 0.1445, 0.1529, 0.1274, 0.1403, 0.1431, 0.1394, 0.1381, 0.1439, 0.1560, 0.1492, 0.1420, 0.1286, 0.1464, 0.1423, 0.1320, 0.1417, 0.1409, 0.1436, 0.1348, 0.1486, 0.1488, 0.1500, 0.1473, 0.1528, 0.1491, 0.1511, 0.1404, 0.1443, 0.1393, 0.1318, 0.1398, 0.1376, 0.1499, 0.1302, 0.1416, 0.1467, 0.1373, 0.1526, 0.1475, 0.1378, 0.1498, 0.1472, 0.1398, 0.1436, 0.1444, 0.1478, 0.1415, 0.1371, 0.1651, 0.1421, 0.1332, 0.1408, 0.1500, 0.1459, 0.1312, 0.1358, 0.1368, 0.1362, 0.1510, 0.1549, 0.1423, 0.1320, 0.1441, 0.1453, 0.1481, 0.1545, 0.1495, 0.1385, 0.1389, 0.1387, 0.1406, 0.1464, 0.1436, 0.1371, 0.1519, 0.1434, 0.1413, 0.1597, 0.1393, 0.1403, 0.1496, 0.1350, 0.1528, 0.1423, 0.1283, 0.1483, 0.1117, 0.1608, 0.1556, 0.1344, 0.1413, 0.1461, 0.1481, 0.1418, 0.1349, 0.1287, 0.1354, 0.1481, 0.1317, 0.1338, 0.1370, 0.1488, 0.1346, 0.1499, 0.1484, 0.1566, 0.1398, 0.1511, 0.1408)
db_loss <- data.frame(weight_loss)

# Average Loss 
average_loss <- k *(sum((db_loss$weight_loss - 0.136)^2))/length(db_loss$weight_loss)
print(average_loss)

# Expected loss per minute
loss_minute <- 7168

expected_loss <- loss_minute * average_loss
print(expected_loss)

# SixSigma Analysis - Loss Function
ss.lfa(db_loss, "weight_loss", delta, y0, L0,
       lfa.sub = "Taguchi Loss Function",
       lfa.size = loss_minute, lfa.output = "both")
