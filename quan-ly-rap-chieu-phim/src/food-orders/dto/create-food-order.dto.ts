import { IsInt, IsOptional, IsNumber, IsPositive } from 'class-validator';

export class CreateFoodOrderDto {
  @IsInt({ message: 'customer_id phải là số nguyên' })
  @IsOptional()
  customer_id?: number;

  @IsNumber({}, { message: 'total_amount phải là số' })
  @IsPositive({ message: 'total_amount phải lớn hơn 0' })
  @IsOptional()
  total_amount?: number;
}
