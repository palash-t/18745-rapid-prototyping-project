INSERT INTO biometric(id, patient_id, heart_rate, sbp, dbp) VALUES
('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000000', 61, 120, 180),
('00000000-0000-0000-0000-000000000002', '20000000-0000-0000-0000-000000000000', 62, 120, 180),
('00000000-0000-0000-0000-000000000003', '30000000-0000-0000-0000-000000000000', 63, 120, 200),
('00000000-0000-0000-0000-000000000004', '40000000-0000-0000-0000-000000000000', 64, 120, 4000);

INSERT INTO accels(id, accel_id, description, patient_id, x, y, z) VALUES
('00000000-0000-0000-0000-000000000010', '00000000-0000-0000-0001-000000000000', 'test accel 1', '10000000-0000-0000-0000-000000000000', 1, 2, 3),
('00000000-0000-0000-0000-000000000020', '00000000-0000-0000-0002-000000000000', 'test accel 2', '10000000-0000-0000-0000-000000000000', 4, 5, 6),
('00000000-0000-0000-0000-000000000030', '00000000-0000-0000-0001-000000000000', 'test accel 1', '20000000-0000-0000-0000-000000000000', 7, 8, 9),
('00000000-0000-0000-0000-000000000040', '00000000-0000-0000-0002-000000000000', 'test accel 2', '20000000-0000-0000-0000-000000000000', 10, 11, 12);

INSERT INTO gyros(id, gyro_id, description, patient_id, x, y, z) VALUES
('00000000-0000-0000-0000-000000000100', '00000000-0000-0001-0000-000000000000', 'test gyro 1', '10000000-0000-0000-0000-000000000000', 1, 2, 3),
('00000000-0000-0000-0000-000000000200', '00000000-0000-0002-0000-000000000000', 'test gyro 2', '10000000-0000-0000-0000-000000000000', 4, 5, 6),
('00000000-0000-0000-0000-000000000300', '00000000-0000-0001-0000-000000000000', 'test gyro 1', '20000000-0000-0000-0000-000000000000', 7, 8, 9),
('00000000-0000-0000-0000-000000000400', '00000000-0000-0002-0000-000000000000', 'test gyro 2', '20000000-0000-0000-0000-000000000000', 10, 11, 12);

INSERT INTO test(id, test_id, description, patient_id, test_score) VALUES
('00000000-0000-0000-0000-000000001000', '00000000-0001-0000-0000-000000000000', 'test 1', '10000000-0000-0000-0000-000000000000', 1),
('00000000-0000-0000-0000-000000002000', '00000000-0002-0000-0000-000000000000', 'test 2', '10000000-0000-0000-0000-000000000000', 2),
('00000000-0000-0000-0000-000000003000', '00000000-0001-0000-0000-000000000000', 'test 1', '20000000-0000-0000-0000-000000000000', 3),
('00000000-0000-0000-0000-000000004000', '00000000-0002-0000-0000-000000000000', 'test 2', '20000000-0000-0000-0000-000000000000', 4);

INSERT INTO game(id, game_id, description, patient_id, left_hand_score, right_hand_score, time_played) VALUES
('00000000-0000-0000-0000-000000010000', '00000001-0000-0000-0000-000000000000', 'test game 1', '10000000-0000-0000-0000-000000000000', 5, 6, 10),
('00000000-0000-0000-0000-000000020000', '00000002-0000-0000-0000-000000000000', 'test game 2', '10000000-0000-0000-0000-000000000000', 6, 7, 11),
('00000000-0000-0000-0000-000000030000', '00000001-0000-0000-0000-000000000000', 'test game 1', '20000000-0000-0000-0000-000000000000', 7, 8, 12),
('00000000-0000-0000-0000-000000040000', '00000002-0000-0000-0000-000000000000', 'test game 2', '20000000-0000-0000-0000-000000000000', 8, 9, 13);

INSERT INTO emotion(id, patient_id, dominant_emotion, neutral, anger, happiness, surprise, sadness) VALUES
('00000000-0000-0000-0000-000000100000', '10000000-0000-0000-0000-000000000000', 'neutral', 0.7, 0.1, 0.05, 0.05, 0.1),
('00000000-0000-0000-0000-000000200000', '20000000-0000-0000-0000-000000000000', 'happiness', 0.2, 0.1, 0.4, 0.1, 0.2),
('00000000-0000-0000-0000-000000300000', '30000000-0000-0000-0000-000000000000', 'anger', 0.1, 0.9, 0.0, 0.0, 0.0),
('00000000-0000-0000-0000-000000400000', '40000000-0000-0000-0000-000000000000', 'surprise', 0.2, 0.1, 0.1, 0.5, 0.1),
('00000000-0000-0000-0000-000000500000', '50000000-0000-0000-0000-000000000000', 'sadness', 0.0, 0.0, 0.0, 0.4, 0.5);

INSERT INTO personal_check_in(id, patient_id, category, value) VALUES
('00000000-0000-0000-0000-000001000000', '01000000-0000-0000-0000-000000000000', 'sports', 'soccer'),
('00000000-0000-0000-0000-000003000000', '01000000-0000-0000-0000-000000000000', 'sports', 'basketball'),
('00000000-0000-0000-0000-000005000000', '01000000-0000-0000-0000-000000000000', 'instruments', 'violin'),
('00000000-0000-0000-0000-000002000000', '02000000-0000-0000-0000-000000000000', 'sports', 'baseball'),
('00000000-0000-0000-0000-000004000000', '02000000-0000-0000-0000-000000000000', 'sports', 'hockey'),
('00000000-0000-0000-0000-000006000000', '02000000-0000-0000-0000-000000000000', 'instruments', 'piano');

INSERT INTO medication(id, patient_id, device_id, scheduled_time, response) VALUES
('00000000-0000-0000-0000-000010000000', '01000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000001', 'morning', True),
('00000000-0000-0000-0000-000030000000', '01000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000001', 'afternoon', False),
('00000000-0000-0000-0000-000050000000', '01000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000001', 'afternoon', True),
('00000000-0000-0000-0000-000020000000', '02000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000002', 'morning', False),
('00000000-0000-0000-0000-000040000000', '02000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000002', 'morning', True),
('00000000-0000-0000-0000-000060000000', '02000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000002', 'afternoon', True);
