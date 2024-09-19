package com.example.cinemaapp.seat;

import com.example.cinemaapp.room.Room;
import com.example.cinemaapp.seatType.SeatType;
import com.example.cinemaapp.ticket.Ticket;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "seat")
public class Seat {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id")
    private Integer id;

    @Column(name = "row_letter")
    private String rowLetter;

    @Column(name = "column_number")
    private Integer columnNumber;

    @Column(name = "is_occupied")
    private Boolean isOccupied;

    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;

    @ManyToOne
    @JoinColumn(name = "type_id")
    private SeatType type;

    @JsonIgnore
    @OneToMany(mappedBy = "seat")
    List<Ticket> tickets;

}
