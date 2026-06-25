import { IsString, Matches, MaxLength, MinLength } from 'class-validator';

export class RegisterUserDto {
  @IsString({ message: 'Username phải là chuỗi ký tự' })
  @MinLength(3, { message: 'Username phải có ít nhất 3 ký tự' })
  @MaxLength(50, { message: 'Username tối đa 50 ký tự' })
  @Matches(/^[a-zA-Z0-9_]+$/, {
    message: 'Username chỉ gồm chữ, số và dấu gạch dưới',
  })
  username: string;

  @IsString({ message: 'Password phải là chuỗi ký tự' })
  @MinLength(6, { message: 'Password phải có ít nhất 6 ký tự' })
  @MaxLength(128, { message: 'Password tối đa 128 ký tự' })
  password: string;
}
