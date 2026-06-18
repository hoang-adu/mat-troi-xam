import { IsInt, IsNumber, IsOptional, IsPositive, Min } from 'class-validator';

export class CreateTicketDto {
  /**
   * ID của đơn đặt vé
   * @example 1
   */
  @IsInt({ message: 'booking_id phải là số nguyên' })
  @IsPositive({ message: 'booking_id phải lớn hơn 0' })
  booking_id: number;

  /**
   * ID của suất chiếu
   * @example 2
   */
  @IsInt({ message: 'showtime_id phải là số nguyên' })
  @IsPositive({ message: 'showtime_id phải lớn hơn 0' })
  showtime_id: number;

  /**
   * ID của ghế ngồi
   * @example 3
   */
  @IsInt({ message: 'seat_id phải là số nguyên' })
  @IsPositive({ message: 'seat_id phải lớn hơn 0' })
  seat_id: number;

  /**
   * Giá vé (đơn vị: VNĐ)
   * @example 75000
   */
  @IsOptional()
  @IsNumber({}, { message: 'ticket_price phải là số' })
  @Min(0, { message: 'ticket_price không được âm' })
  ticket_price?: number;
}
