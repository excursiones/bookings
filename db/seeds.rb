# Create types
Type.create(name: "Excursion")
Type.create(name: "Plan")

Reservation.create({ id_user: "1", id_excursion: "1", id_type: "1", cancelled: false })
