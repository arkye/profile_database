package br.unb.itrac.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import br.unb.itrac.model.ScaleOption;

@Component
public class ScaleOptionToStringConverter implements Converter<ScaleOption, String>{

	@Override
	public String convert(ScaleOption scaleOption) {
		return scaleOption.toString();
	}
}
