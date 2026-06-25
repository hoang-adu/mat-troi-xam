import { BadRequestException, Injectable, UnauthorizedException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import * as bcrypt from 'bcryptjs';
import { JwtService } from '@nestjs/jwt';
import { RegisterUserDto } from './dto/register-user.dto';
import { User } from './user.entity';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
    private readonly jwtService: JwtService,
  ) {}

  async register(registerUserDto: RegisterUserDto) {
    const { username, password } = registerUserDto;
    const existingUser = await this.userRepository.findOne({
      where: { username },
    });

    if (existingUser) {
      throw new BadRequestException('Username đã tồn tại');
    }

    const hashedPassword = await bcrypt.hash(password, 12);
    const user = this.userRepository.create({
      username,
      password: hashedPassword,
    });

    const savedUser = await this.userRepository.save(user);
    const result = { ...savedUser };
    delete result.password;
    return result;
  }

  async validateUser(username: string, password: string) {
    const user = await this.userRepository.findOne({
      where: { username },
    });
    if (!user) {
      return null;
    }

    if (!user.password) {
      return null;
    }

    const passwordMatches = await bcrypt.compare(password, user.password);
    if (!passwordMatches) {
      return null;
    }

    const result = { ...user };
    delete result.password;
    return result;
  }

  async login(user: { username: string; user_id: number }) {
    const payload = { username: user.username, sub: user.user_id };
    return {
      access_token: this.jwtService.sign(payload),
    };
  }
}
