package com.example.cinemaapp.seatType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SeatTypeResponse {
    private List<SeatType> seatTypes;
}
