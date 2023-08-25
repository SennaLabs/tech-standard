import { FC, SVGProps } from "react";
import { IconProps } from "./interface";

export const Svg = (
  SvgComponent: FC<SVGProps<SVGSVGElement>>
): React.FC<IconProps> => {
  return function Icon({
    height = "24",
    width = "24",
    className = "",
  }: IconProps) {
    const svgProps = {
      height,
      width,
      className,
    };
    return <SvgComponent {...svgProps} />;
  };
};
