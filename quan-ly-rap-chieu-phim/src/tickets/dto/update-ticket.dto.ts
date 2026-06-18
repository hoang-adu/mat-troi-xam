import { PartialType } from '@nestjs/mapped-types';
import { CreateTicketDto } from './create-ticket.dto';

/**
 * DTO cập nhật vé — tất cả trường đều không bắt buộc (PartialType)
 */
export class UpdateTicketDto extends PartialType(CreateTicketDto) {}
