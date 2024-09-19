package com.example.cinemaapp.room;

import com.example.cinemaapp.cinema.Cinema;
import com.example.cinemaapp.seat.Seat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "room")
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id")
    private Integer id;

    @Column(name = "room_number")
    private Integer roomNumber;

    @Column(name = "capacity")
    private Integer capacity;

    @Column(name = "occupied")
    private Integer occupied;

    @Column(name = "is_open")
    private Boolean isOpen;

    @ManyToOne
    @JoinColumn(name = "cinema_id")
    private Cinema cinema;

    @JsonIgnore
    @OneToMany(mappedBy = "room")
    List<Seat> seats;
}