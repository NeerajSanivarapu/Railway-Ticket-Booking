package Dto;


import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.Data;


@Entity
@Data
public class TrainTicket {
	@Id
	@GeneratedValue(generator = "pnr")
	@SequenceGenerator(initialValue = 4566541,allocationSize = 1,name = "pnr",sequenceName = "pnr")
	int pnr;
	int trainNumber;
	String source;
	String destination;
	int numberOfSeats;
	double amount;
	Date dateOfBooking;
	Date dateOfJourney;
	String status;
	


	@ManyToOne
	User user;
}