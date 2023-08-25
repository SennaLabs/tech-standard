import { Field } from '@nestjs/graphql';
import {
  Column,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Address } from './address.entity';
import { Role } from './role.entity';

@Entity('users')
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  firstName: string;

  @Column()
  lastName: string;

  @Column()
  roleId: number;

  @ManyToOne(() => Role, (role) => role.users)
  role: Role;

  @Field(() => [Address], { nullable: true })
  @OneToMany(() => Address, (address) => address.user, {
    cascade: ['insert', 'update'],
  })
  addresses?: Address[];
}
