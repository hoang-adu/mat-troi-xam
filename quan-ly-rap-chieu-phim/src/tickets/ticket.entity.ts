import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity('tickets')
export class Ticket {
  @PrimaryGeneratedColumn()
  ticket_id: number;

  @Column({ nullable: false })
  booking_id: number;

  @Column({ nullable: false })
  showtime_id: number;

  @Column({ nullable: false })
  seat_id: number;

  @Column({
    type: 'decimal',
    precision: 10,
    scale: 2,
    nullable: true,
  })
  ticket_price: number;
}
