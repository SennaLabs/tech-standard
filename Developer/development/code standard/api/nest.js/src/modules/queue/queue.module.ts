import { BullModule } from '@nestjs/bull';
import { Global, Module } from '@nestjs/common';

import { QUEUE_ADMIN_EMAIL } from './queue.constraints';

import { AdminEmailProcessor } from './admin-email.processor';
import { AdminEmailService } from './admin-email.service';

@Global()
@Module({
  imports: [BullModule.registerQueue({ name: QUEUE_ADMIN_EMAIL })],
  providers: [AdminEmailProcessor, AdminEmailService],
  exports: [AdminEmailService],
})
export class QueueModule {}
