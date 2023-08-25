import {
  Column,
  Entity,
  PrimaryGeneratedColumn,
  CreateDateColumn,
  UpdateDateColumn,
  ManyToOne,
  JoinColumn,
  DeleteDateColumn,
} from 'typeorm';
import { ObjectType, Field } from '@nestjs/graphql';
import { User } from './user.entity';

@ObjectType()
@Entity('addresses')
export class Address {
  @PrimaryGeneratedColumn()
  id: number;

  @Field({ nullable: true })
  @Column({ nullable: true })
  fullName: string

  @Field({ nullable: true })
  @Column({ nullable: true })
  address: string

  @Field({ nullable: true })
  @Column({ nullable: true })
  postcode: string

  @Field({ nullable: true })
  @Column({ nullable: true })
  province: string

  @Field({ nullable: true })
  @Column({ nullable: true })
  district: string

  @Field({ nullable: true })
  @Column({ nullable: true })
  subDistrict: string

  @Field({ nullable: true })
  @Column({ nullable: true })
  phoneNumber: string

  @Field({ nullable: true })
  @Column({ nullable: true })
  email: string

  @Field()
  @Column({ default: false })
  isDefault: boolean

  @Field(() => User)
  @ManyToOne(() => User, user => user.addresses, {onDelete: 'CASCADE'})
  user: User

  @Field()
  @CreateDateColumn({ readonly: true })
  createdAt: Date

  @UpdateDateColumn({ readonly: true })
  updatedAt: Date

  @DeleteDateColumn({ readonly: true })
  deletedAt: Date
}
