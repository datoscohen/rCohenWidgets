import { reactShinyInput } from 'reactR';
import PasswordStrengthBar from 'react-password-strength-bar';

const PasswordInputBar = ({ configuration, value, setValue }) => {
 return (
  <div>
    <div class="form-group shiny-input-container">
      <label class="control-label">
      <i class="fas fa-lock" role="presentation" aria-label="lock icon"></i>
        &nbsp;Nueva Contraseña
      </label>
      <input type="password" class="form-control" value={value} onChange={e => setValue(e.target.value)}/>
    </div>
    <PasswordStrengthBar
      password={value}
      scoreWords={configuration.scoreWords}
      minLength={configuration.minLength}
      shortScoreWord={configuration.shortScoreWord}
      />
  </div>
  );
};

reactShinyInput('.strengthBar', 'rCohenWidgets.strengthBar', PasswordInputBar);
