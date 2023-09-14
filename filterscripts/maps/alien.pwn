new alien_obj[28];
new alien_actor[3];
alien_obj[0] = CreateDynamicObject(18846, 1917.9483, -1428.5412, 10.0472, 23.7999, 0.0000, 0.0000); //BigCesar
alien_obj[1] = CreateDynamicObject(747, 1915.8038, -1429.9816, 9.2558, 0.0000, 0.0000, 0.0000); //sm_scrub_rock3
alien_obj[2] = CreateDynamicObject(2976, 1915.4522, -1424.9345, 10.5190, 91.1000, 0.1999, -91.6999); //green_gloop
alien_obj[3] = CreateDynamicObject(747, 1917.5736, -1431.6016, 9.4258, 0.0000, 0.0000, 0.0000); //sm_scrub_rock3
alien_obj[4] = CreateDynamicObject(747, 1919.5136, -1431.6016, 9.4258, 0.0000, 0.0000, 0.0000); //sm_scrub_rock3
alien_obj[5] = CreateDynamicObject(747, 1921.3646, -1429.6315, 9.0858, 0.0000, 0.0000, 0.0000); //sm_scrub_rock3
alien_obj[6] = CreateDynamicObject(747, 1917.1341, -1428.5623, 8.4858, 0.0000, 0.0000, 0.0000); //sm_scrub_rock3
alien_obj[7] = CreateDynamicObject(747, 1918.9943, -1428.5623, 8.3458, 0.0000, 0.0000, 0.0000); //sm_scrub_rock3
alien_obj[8] = CreateDynamicObject(747, 1920.1850, -1429.0424, 8.5058, 0.0000, 0.0000, 0.0000); //sm_scrub_rock3
alien_obj[9] = CreateDynamicObject(1427, 1927.0610, -1429.5400, 10.0915, 0.3000, 0.0000, 91.1999); //CJ_ROADBARRIER
alien_obj[10] = CreateDynamicObject(1427, 1927.0345, -1428.2799, 10.0915, 0.3000, 0.0000, 91.1999); //CJ_ROADBARRIER
alien_obj[11] = CreateDynamicObject(1427, 1927.0090, -1427.0694, 10.0915, 0.3000, 0.0000, 91.1999); //CJ_ROADBARRIER
alien_obj[12] = CreateDynamicObject(1427, 1926.9780, -1425.5898, 10.0915, 0.3000, 0.0000, 91.1999); //CJ_ROADBARRIER
alien_obj[13] = CreateDynamicObject(1427, 1926.9371, -1423.6306, 10.0915, 0.3000, 0.0000, 91.1999); //CJ_ROADBARRIER
alien_obj[14] = CreateDynamicObject(1427, 1909.9902, -1423.5645, 10.1802, 0.3000, 0.0000, 91.1999); //CJ_ROADBARRIER
alien_obj[15] = CreateDynamicObject(1427, 1910.0098, -1424.5042, 10.1802, 0.3000, 0.0000, 91.1999); //CJ_ROADBARRIER
alien_obj[16] = CreateDynamicObject(1427, 1910.0367, -1425.7843, 10.1802, 0.3000, 0.0000, 91.1999); //CJ_ROADBARRIER
alien_obj[17] = CreateDynamicObject(1427, 1910.0642, -1427.1148, 10.1802, 0.3000, 0.0000, 91.1999); //CJ_ROADBARRIER
alien_obj[18] = CreateDynamicObject(1427, 1910.1187, -1429.7054, 10.1802, 0.3000, 0.0000, 91.1999); //CJ_ROADBARRIER
alien_obj[19] = CreateDynamicObject(367, 1912.5762, -1425.2460, 10.4389, 0.0000, 0.0000, -60.1999); //camera
alien_obj[20] = CreateDynamicObject(19997, 1914.9854, -1424.9410, 9.4775, 0.0000, 0.0000, 86.4000); //CutsceneGrgTable1
alien_obj[21] = CreateDynamicObject(18689, 1916.5267, -1430.7463, 9.0093, 0.0000, 0.0000, 0.0000); //fire_bike
alien_obj[22] = CreateDynamicObject(18691, 1920.1928, -1430.4893, 9.1954, 0.0000, 0.0000, 0.0000); //fire_large
alien_obj[23] = CreateDynamicObject(18689, 1917.2269, -1430.7463, 9.0093, 0.0000, 0.0000, 0.0000); //fire_bike
alien_obj[24] = CreateDynamicObject(18689, 1916.5067, -1429.3662, 9.8993, 0.0000, 0.0000, 0.0000); //fire_bike
alien_obj[25] = CreateDynamicObject(18689, 1919.5471, -1429.3662, 9.8993, 0.0000, 0.0000, 0.0000); //fire_bike
alien_obj[26] = CreateDynamicObject(18689, 1919.2873, -1430.6269, 9.0393, 0.0000, 0.0000, 0.0000); //fire_bike
alien_obj[27] = CreateDynamicObject(18689, 1919.9477, -1429.5467, 9.4193, 0.0000, 0.0000, 0.0000); //fire_bike
alien_actor[0] = CreateActor(286, 1912.5045, -1425.1394, 10.6270, -131.8999); //Federal Agent
ApplyActorAnimation(alien_actor[0], "CAMERA", "PICCRCH_TAKE", 4.0999, 1, 0, 0, 0, 0);
alien_actor[1] = CreateActor(286, 1915.0941, -1423.9527, 10.3193, -178.0999); //Federal Agent
alien_actor[2] = CreateActor(77, 1875.9691, -1315.0555, 29.4921, 0.0000); //Homeless
ApplyActorAnimation(alien_actor[2], "CRACK", "CRCKIDLE4", 4.0999, 1, 0, 0, 0, 0);