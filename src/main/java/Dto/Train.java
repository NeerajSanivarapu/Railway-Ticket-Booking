package Dto;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class Train {
	@Id
	int number;
	String name;
	int seat;
	String[] stations;
	String[] price;
	String[] time;
	String[] days;
	
	
}