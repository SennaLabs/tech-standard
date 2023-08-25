import { Field, InputType, Int } from '@nestjs/graphql';
import { PrimaryGeneratedColumn } from 'typeorm';

@InputType()
export class CreateAddressInput {
  @Field(() => String)
  fullName: string;

  @Field(() => String)
  address: string;

  @Field(() => String)
  postcode: string;

  @Field(() => String)
  province: string;

  @Field(() => String)
  district: string;

  @Field(() => String)
  subDistrict: string;

  @Field(() => String)
  phoneNumber: string;

  @Field(() => String, { nullable: true })
  email: string;

  @Field(() => Boolean)
  isDefault: boolean;
}
