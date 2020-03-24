# Player.destroy_all, Team.destroy_all, Contract.destroy_all

player_1 = Player.create(name: "Ronaldo", age: 35, position: "Striker", injured: false)
player_2 = Player.create(name: "Messi",age: 32, position: "Striker", injured: false)
player_3 = Player.create(name: "Kane",age: 25, position: "Striker", injured: true, injury_start: "2020/01/10", injury_predicted_end: "2020/06/10")
player_4 = Player.create(name: "Rashford", age: 21, position: "Striker", injured: true, injury_start: "2020/01/15", injury_predicted_end: "2020/04/10")


team_1 = Team.create(name: "Manchester United",founded: 1878,cups_won: 50)
team_2 = Team.create(name: "Real Madrid",founded: 1902,cups_won: 72)


contract_1 = Contract.create(start_day: "2019/11/20", end_day: "2025/12/21", wage: 100000, transfer_fee: 10000, player_id: player_1.id,team_id: team_1.id)
contract_2 = Contract.create(start_day: "2019/11/22", end_day: "2025/12/22", wage: 200000, transfer_fee: 20000, player_id: player_2.id,team_id: team_2.id)
contract_3 = Contract.create(start_day: "2019/11/23", end_day: "2025/12/23", wage: 300000, transfer_fee: 30000, player_id: player_3.id,team_id: team_1.id)
contract_4 = Contract.create(start_day: "2019/11/24", end_day: "2025/12/24", wage: 400000, transfer_fee: 40000, player_id: player_4.id,team_id: team_1.id)

